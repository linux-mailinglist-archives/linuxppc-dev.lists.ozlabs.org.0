Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF16432A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 09:57:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kBPX4x3zzDqgW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:57:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mo6-p00-ob.smtp.rzone.de
 (client-ip=2a01:238:20a:202:5300::5; helo=mo6-p00-ob.smtp.rzone.de;
 envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="auvFnbbF"; 
 dkim-atps=neutral
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kBMx1dktzDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 17:56:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1562745376;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=L4p4B2iUo/5zhgLYvS5YlOgcGDvoyf0lT1HWf6lgos8=;
 b=auvFnbbF+JdvHpMGItf2UNtz/+d2O6cKL1vDpU8MJCxnaD5G1iYTi+WZm9OhrTtGQU
 QYWXK3j7q4K23MsZ0leZY4dkmvKfM1JYYrn9YZPhmD2zMmxrU8dQ+ce4iAh8eI/LzpE7
 iE8GIaqv7t3navIEnnZ+v1pxqBvzV6ZJsMKzYAiQy7oeaMixavHxEB+YFPBbk73pnj+y
 dt1wqnrmrPSPqrayTdDKk/ReOGwzgy007k85oDxVyAR7TJaoqVp7qjG2RAGtI0IRmTUL
 /r5Eatfl8SqpBdqBJi3wyvuEyp+Xc9CLwf7rCvYpFXv3z1gfzvWlp58/VZskjF0bWM1n
 zBeg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgGLoYnXJxg669q60jyrLIz5LGVnA=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:e822:8ba9:ed65:5a5c]
 by smtp.strato.de (RZmta 44.24 AUTH) with ESMTPSA id U0b154v6A7tsFEy
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 10 Jul 2019 09:55:54 +0200 (CEST)
Subject: [PATCH v3] cpufreq/pasemi: fix an use-after-free
 inpas_cpufreq_cpu_init()
To: wen.yang99@zte.com.cn, linuxppc-dev@lists.ozlabs.org
References: <201907090939164296374@zte.com.cn>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <98d26400-ceab-ffd9-aea5-9bdf613bd5dc@xenosoft.de>
Date: Wed, 10 Jul 2019 09:55:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <201907090939164296374@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Is a final patch available for testing? Please do not release it without 
testing.

- Christian

On 09-07-19, 16:04, Wen Yang wrote:
 > The cpu variable is still being used in the of_get_property() call
 > after the of_node_put() call, which may result in use-after-free.
 >
 > Fixes: a9acc26b75f ("cpufreq/pasemi: fix possible object reference leak")
 > Signed-off-by: Wen Yang <wen.yang99 at zte.com.cn>
 > Cc: "Rafael J. Wysocki" <rjw at rjwysocki.net>
 > Cc: Viresh Kumar <viresh.kumar at linaro.org>
 > Cc: Michael Ellerman <mpe at ellerman.id.au>
 > Cc: linuxppc-dev at lists.ozlabs.org
 > Cc: linux-pm at vger.kernel.org
 > Cc: linux-kernel at vger.kernel.org
 > ---
 > v5: put together the code to get, use, and release cpu device_node.
 > v4: restore the blank line.
 > v3: fix a leaked reference.
 > v2: clean up the code according to the advice of viresh.
 >
 >  drivers/cpufreq/pasemi-cpufreq.c | 21 +++++++++------------
 >  1 file changed, 9 insertions(+), 12 deletions(-)
 >
 > diff --git a/drivers/cpufreq/pasemi-cpufreq.c 
b/drivers/cpufreq/pasemi-cpufreq.c
 > index 6b1e4ab..1f0beb7 100644
 > --- a/drivers/cpufreq/pasemi-cpufreq.c
 > +++ b/drivers/cpufreq/pasemi-cpufreq.c
 > @@ -131,10 +131,17 @@ static int pas_cpufreq_cpu_init(struct 
cpufreq_policy *policy)
 >      int err = -ENODEV;
 >
 >      cpu = of_get_cpu_node(policy->cpu, NULL);
 > -
 > -    of_node_put(cpu);
 >      if (!cpu)
 >          goto out;

I would have loved a blank line here :)

 > +    max_freqp = of_get_property(cpu, "clock-frequency", NULL);
 > +    of_node_put(cpu);
 > +    if (!max_freqp) {
 > +        err = -EINVAL;
 > +        goto out;
 > +    }
 > +
 > +    /* we need the freq in kHz */
 > +    max_freq = *max_freqp / 1000;
 >
 >      dn = of_find_compatible_node(NULL, NULL, "1682m-sdc");
 >      if (!dn)
 > @@ -171,16 +178,6 @@ static int pas_cpufreq_cpu_init(struct 
cpufreq_policy *policy)
 >      }
 >
 >      pr_debug("init cpufreq on CPU %d\n", policy->cpu);
 > -
 > -    max_freqp = of_get_property(cpu, "clock-frequency", NULL);
 > -    if (!max_freqp) {
 > -        err = -EINVAL;
 > -        goto out_unmap_sdcpwr;
 > -    }
 > -
 > -    /* we need the freq in kHz */
 > -    max_freq = *max_freqp / 1000;
 > -
 >      pr_debug("max clock-frequency is at %u kHz\n", max_freq);
 >      pr_debug("initializing frequency table\n");

Though, enough versions have happened now.

Acked-by: Viresh Kumar <viresh.kumar at linaro.org>

-- 
viresh

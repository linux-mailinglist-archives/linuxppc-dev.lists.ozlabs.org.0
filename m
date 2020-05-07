Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C861C817C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 07:20:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HhcL2FtjzDqvx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 15:20:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=slcpKIce; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HhZD4sLvzDqv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 15:18:25 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r14so2413039pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 May 2020 22:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EjwpJVR1oS9DdS7pegxHcKxChjnzSaTIkyZTVhILaoo=;
 b=slcpKIceAq3cfjYgNr8Zhq1cKoLAoXXqoHotEAb2xiQ35kfA512G47MwpKhZXuM/7e
 CPnlmatcZzVIRfNzpy00KH25stfePubouqjpWYnEmzYbZ4ABGq0cZy3Nmuh7tvH2wUGL
 a5veNcqHV2kXAgW7D+G/lGfw7VAQcdJhiOQnGPFvP3w7C1vRRwMk7rCHjG23Uw3Q0w1u
 jBhgWVFKipZ/m5hr6AzK9WoqH9NgDiX0dGl4AWiRoCTXvB4aa07ZvnHrV99m3lGg3wsh
 //8wutcZlOEfr0/AnEAjs7Cc4yZV4yYPA2Db4R7sXaVoPjV+1d9BSXEk4soUalWD6wMI
 L1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EjwpJVR1oS9DdS7pegxHcKxChjnzSaTIkyZTVhILaoo=;
 b=OP4l0q2cXD9+sWt756BfDp0s5AVjOZJAEB5ZqxFPzbspvuuhDmQtlnyX2nnUst78ra
 TM8sRMq9h9BYf7Lr32G6z96zTbZHB0Rov999cNxQloyb0bw2qHrqbuQqP8HHNn/8BgBc
 6/2CXOw+Yl+cxKwIAVx5jUEekSrQ3nLgQrWdTXcD6It/RzlItQOP2/EBNu4P69CLC1Wx
 BYrFNgR6cM5IQ5kiBQsxvk5V/bW4LvmucOSOZmIEpcWhnLZ6oWXOKmiEFps98bAJg8Ai
 qLiXKFewdhZaGFy70H0FHtSEI8C+EPaCApOIAwFK0Ed1Un7QtoTj6uWnhuEMfbR3Y62e
 QOyA==
X-Gm-Message-State: AGi0PuYxgvNu3+vKgse84xJK1P+7KMmtBNfdJRniXxVwFCxMcI2BT7lZ
 2oNrC2x7xcJLJ9a8gzY0WqJjzA==
X-Google-Smtp-Source: APiQypIEmsP8B+EwGLQga6A4T0mFxXwfh7oJIQ8PZk2O+MdkKuUNTJ0xX+z5cnzD4HZ+G174irQzXg==
X-Received: by 2002:a62:3181:: with SMTP id
 x123mr11697759pfx.109.1588828701997; 
 Wed, 06 May 2020 22:18:21 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id v127sm3499629pfv.77.2020.05.06.22.18.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 May 2020 22:18:21 -0700 (PDT)
Date: Thu, 7 May 2020 10:48:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rjw@rjwysocki.net, Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: Re: [PATCH v2 1/2] cpufreq: qoriq: convert to a platform driver
Message-ID: <20200507051818.xi43yfusjktemd5r@vireshk-i7>
References: <20200421083000.16740-1-ykaukab@suse.de>
 <20200428110125.lobyrsbma6astfmq@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428110125.lobyrsbma6astfmq@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: andy.tang@nxp.com, linux-pm@vger.kernel.org, sboyd@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com, shawnguo@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28-04-20, 16:31, Viresh Kumar wrote:
> On 21-04-20, 10:29, Mian Yousaf Kaukab wrote:
> > The driver has to be manually loaded if it is built as a module. It
> > is neither exporting MODULE_DEVICE_TABLE nor MODULE_ALIAS. Moreover,
> > no platform-device is created (and thus no uevent is sent) for the
> > clockgen nodes it depends on.
> > 
> > Convert the module to a platform driver with its own alias. Moreover,
> > drop whitelisted SOCs. Platform device will be created only for the
> > compatible platforms.
> > 
> > Reviewed-by: Yuantian Tang <andy.tang@nxp.com>
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> > ---
> > v2:
> >  +Rafael, Stephen, linux-clk
> >  Add Reviewed-by and Acked-by tags
> > 
> >  drivers/cpufreq/qoriq-cpufreq.c | 76 ++++++++++++++++-------------------------
> >  1 file changed, 29 insertions(+), 47 deletions(-)
> 
> @Rafael,
> 
> Though this looks to be PPC stuff, but it is used on both ARM and PPC. Do you
> want to pick them up or should I do that ?

Applied now. Thanks.

-- 
viresh

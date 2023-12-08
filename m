Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0B80A226
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 12:28:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=scram.de header.i=@scram.de header.a=rsa-sha256 header.s=mail2021 header.b=OgcexWGU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmpmR6rlPz3cXJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 22:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=scram.de header.i=@scram.de header.a=rsa-sha256 header.s=mail2021 header.b=OgcexWGU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=scram.de (client-ip=195.226.126.84; helo=esg.nwe.de; envelope-from=jochen@scram.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 913 seconds by postgrey-1.37 at boromir; Fri, 08 Dec 2023 22:27:37 AEDT
Received: from esg.nwe.de (esg.nwe.de [195.226.126.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmplY0y24z3cR8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 22:27:36 +1100 (AEDT)
X-ASG-Debug-ID: 1702033934-1ed71d5dc8174fa10001-v7v7hK
Received: from mail.scram.de ([213.206.175.31]) by esg.nwe.de with ESMTP id FtJNBH7NCVyVmvNv (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 08 Dec 2023 12:12:14 +0100 (CET)
X-Barracuda-Envelope-From: jochen@scram.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.206.175.31]
X-Barracuda-Apparent-Source-IP: 213.206.175.31
Received: (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender)
	by mail.scram.de (Postfix) with ESMTPSA id F1F218A7031;
	Fri,  8 Dec 2023 12:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.scram.de F1F218A7031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scram.de;
	s=mail2021; t=1702033934;
	bh=s9yrExIa366dn3S+pFGBrRwPq6geDOwSJ/tc3OqUeD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OgcexWGUSpSg89Uyju9wzf1zesFDFmj3KHKrqKaOzOH4JVPRVn1mj1zH471YFcm8a
	 q0tu5GgkxvUm0dACo27WH6zWOD+KeHMI3Lp0XpkutPCKt1sCLpLmilXR5TNBwv6L0M
	 uUthIG4o4C6QUmbwZn6jNgGvBuL682o804l6WyDc=
Message-ID: <950ac94b-f488-4879-973e-4014f224c62f@scram.de>
Date: Fri, 8 Dec 2023 12:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andi Shyti <andi.shyti@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
References: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
From: Jochen Friedrich <jochen@scram.de>
In-Reply-To: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: UNKNOWN[213.206.175.31]
X-Barracuda-Start-Time: 1702033934
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://195.226.126.84:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at nwe.de
X-Barracuda-Scan-Msg-Size: 1290
X-Barracuda-BRTS-Status: 0
X-Barracuda-Spam-Score: 0.40
X-Barracuda-Spam-Status: No, SCORE=0.40 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=5.0 tests=BSF_SC0_SA085b
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.117807
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.40 BSF_SC0_SA085b         Custom Rule SA085b
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
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-By: Jochen Friedrich <jochen@scram.de>

Am 06.12.2023 um 23:24 schrieb Christophe Leroy:
> sparse reports an error on some data that gets converted from be32.
>
> That's because that data is typed u32 instead of __be32.
>
> The type is correct, the be32_to_cpu() conversion is not.
>
> Remove the conversion.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@intel.com/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Use u32 directly, remove be32_to_cpu().
> ---
>   drivers/i2c/busses/i2c-cpm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 9a664abf734d..771d60bc8d71 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -658,7 +658,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
>   	/* register new adapter to i2c module... */
>   
>   	data = of_get_property(ofdev->dev.of_node, "linux,i2c-index", &len);
> -	cpm->adap.nr = (data && len == 4) ? be32_to_cpup(data) : -1;
> +	cpm->adap.nr = (data && len == 4) ? *data : -1;
>   	result = i2c_add_numbered_adapter(&cpm->adap);
>   
>   	if (result < 0)

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47746704C23
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 13:18:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLDHq0mrtz3fBh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 21:18:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=scram.de header.i=@scram.de header.a=rsa-sha256 header.s=mail2021 header.b=DUruOuiD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=scram.de (client-ip=195.226.126.84; helo=esg.nwe.de; envelope-from=jochen@scram.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=scram.de header.i=@scram.de header.a=rsa-sha256 header.s=mail2021 header.b=DUruOuiD;
	dkim-atps=neutral
X-Greylist: delayed 1062 seconds by postgrey-1.36 at boromir; Tue, 16 May 2023 21:17:28 AEST
Received: from esg.nwe.de (esg.nwe.de [195.226.126.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLDGw08HGz3ccg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 21:17:27 +1000 (AEST)
X-ASG-Debug-ID: 1684234776-1ed71d5dc8290870001-v7v7hK
Received: from mail.scram.de ([213.206.175.31]) by esg.nwe.de with ESMTP id frkCTtbL0QAy9LA8; Tue, 16 May 2023 12:59:36 +0200 (CEST)
X-Barracuda-Envelope-From: jochen@scram.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.206.175.31]
X-Barracuda-Apparent-Source-IP: 213.206.175.31
Received: (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender)
	by mail.scram.de (Postfix) with ESMTPSA id CCEDA8A7031;
	Tue, 16 May 2023 12:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.scram.de CCEDA8A7031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scram.de;
	s=mail2021; t=1684234776;
	bh=nEo2mLFdd15nlmRH/p5msdgFUoZwDBU31/nzpMEUECM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DUruOuiDQO2rHQwV4lnHT+BIHxgU40QJqIoFcHvKIkr7bFS9hVWIP5LPKQ9YlkE1W
	 LI3CRvU4SdlNpiFochhA8cV8AEZExFLAGMZlhUdleIF4XpApKTmFHtgxW06hITm2Ti
	 dxAjFpfmuBW17h/A6OkFznX65cORMAvnR3ZiFInc=
Message-ID: <8c9fcf47-8d4e-b668-c52c-240a5ed4cc60@scram.de>
Date: Tue, 16 May 2023 12:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/89] i2c: cpm: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH 14/89] i2c: cpm: Convert to platform remove callback
 returning void
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-15-u.kleine-koenig@pengutronix.de>
From: Jochen Friedrich <jochen@scram.de>
In-Reply-To: <20230508205306.1474415-15-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Barracuda-Connect: UNKNOWN[213.206.175.31]
X-Barracuda-Start-Time: 1684234776
X-Barracuda-URL: https://195.226.126.84:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at nwe.de
X-Barracuda-Scan-Msg-Size: 1894
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=5.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.108840
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Jochen Friedrich <jochen@scram.de>

Am 08.05.2023 um 22:51 schrieb Uwe Kleine-König:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/i2c/busses/i2c-cpm.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 24d584a1c9a7..732daf6a932b 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -676,7 +676,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
>   	return result;
>   }
>   
> -static int cpm_i2c_remove(struct platform_device *ofdev)
> +static void cpm_i2c_remove(struct platform_device *ofdev)
>   {
>   	struct cpm_i2c *cpm = platform_get_drvdata(ofdev);
>   
> @@ -685,8 +685,6 @@ static int cpm_i2c_remove(struct platform_device *ofdev)
>   	cpm_i2c_shutdown(cpm);
>   
>   	kfree(cpm);
> -
> -	return 0;
>   }
>   
>   static const struct of_device_id cpm_i2c_match[] = {
> @@ -703,7 +701,7 @@ MODULE_DEVICE_TABLE(of, cpm_i2c_match);
>   
>   static struct platform_driver cpm_i2c_driver = {
>   	.probe		= cpm_i2c_probe,
> -	.remove		= cpm_i2c_remove,
> +	.remove_new	= cpm_i2c_remove,
>   	.driver = {
>   		.name = "fsl-i2c-cpm",
>   		.of_match_table = cpm_i2c_match,

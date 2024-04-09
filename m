Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFFD89D20F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 07:48:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=IUuLvw/t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=XR6uCKpg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDFPp59kHz3vY9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 15:48:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=IUuLvw/t;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=XR6uCKpg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inbox.ru (client-ip=79.137.243.74; helo=fallback22.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 567 seconds by postgrey-1.37 at boromir; Tue, 09 Apr 2024 15:48:06 AEST
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDFP23lx8z2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 15:48:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=9Era2ZLwb79nOsiWvinSwT46I2lLWW20YrV5gIt/5r4=;
	t=1712641686;x=1712731686; 
	b=IUuLvw/t6UXKsIB5su7MhEhZi9K9Zsf6rU6VoVhnU+D7+720JFuxroBZnAKdCtDS5UR7OMeWOZS4RTX0Gg+LnjubrZNBiEor/LS6ISTdTisjDHnuXTHaMM4hLgb1NUStDNpVNAL3lf+GuV8ltQAzMGcmp2aRlt8/b9Pub6uWvthJJx+9mzxDfe68gqrQN+dOO3bOP4ZIm4FNVhkHU1SjFWYeb7RWHYPGPmd1q27EAY5SKU51d8xT2F8SVsl+JXrJQgEQuPJmVp4WEMK7WtljmvHsqwlfJdT+F0VHw+gtFSrjY/CrSZw6Il5wRlJF0iNXQmsGM9WrfnUtRFQ9HIbQvw==;
Received: from [10.12.4.19] (port=35978 helo=smtp43.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1ru4Bm-002MlQ-SE; Tue, 09 Apr 2024 08:38:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=9Era2ZLwb79nOsiWvinSwT46I2lLWW20YrV5gIt/5r4=; t=1712641114; x=1712731114; 
	b=XR6uCKpgxTNmMhZVGfuOD6I5zs1ocQTcD4I6FBtPzEPB6ZjVj4XRfPmJU7vzqr5pFkGO/tPL2Qv
	z+sVfLTWfEQ82+ivIgdt0G/W6GzCorwnZ9uXDs4sVOJVWN88ZlU3qPzIjxmRHMHol2IZMg1DZNrjn
	uZEAzCG74QmX8LvPK+rVX0RX0zK5XfguYuDTwQKNi0C+rXTZjq68o8jI8gB+C/fYDgkKK56ywGqMe
	o5qwlBTw6H9CgqBTfOdRyX8fl2orJpGLOKdncwkFgx5Ls4wQMBecLRwIXtaynGHQZSRV2gGTjkbh9
	/yuOdqdPGc1OqGTWX3+cNaKS1l3c4+0dIkeQ==;
Received: by smtp43.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1ru4BN-00000006joD-2zQ5; Tue, 09 Apr 2024 08:38:10 +0300
Message-ID: <75d00e5b-48b5-47cb-85aa-7b9c6641f30d@inbox.ru>
Date: Tue, 9 Apr 2024 08:38:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: Add check for platform_driver_register
To: Chen Ni <nichen@iscas.ac.cn>, qiang.zhao@nxp.com, leoyang.li@nxp.com,
 saravanak@google.com
References: <20240409030840.666703-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20240409030840.666703-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9D327C87852EB66D327F0ED0D500BEE3D0D2DC2898190C0A0182A05F5380850408A9F00BCF12307122EB5D77EF37489D1CEDD527866A399A4219EC0674805B9AE4A9DBE0811142006
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73B44982FA5E78411EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371DF52D98DC3592C48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B432B0B59149B63E0BF6D59EF90F10D8B04DABB0541D93C920879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C02F11D39E7306DD338941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063783E00425F71A4181389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC8C7ADC89C2F0B2A5E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BC6A536F79815AD9275ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A56981B0E970FC4E695002B1117B3ED69667EBF332286B2BA2FB820E9FE7BD014C823CB91A9FED034534781492E4B8EEADCF86CE9B81855096
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC087879C3E0AE9D034FFC9DC8582B74DEB09DFF268707B050117E0585162983C486D6DC23143AA0E43A9A4803F78FBB9918D2DB24F4611F1B5508CD4504D7F3E782CBDC177B4639536DDF96CB8D31E6A913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRxVvDy3pXer4zRb8upYVeA==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3310D6C9911FFDEF1902AB133316F7432E1C8ED5244191747D90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4DB7CCFC93CF1872EA8D575E5E21AE01D964B60085DACEEB368F3CF0E9FE49B69E64074A9175417A88727D7F6DF2777CD78C82047CA4AE4585B36B8EC0B0619EB
X-7FA49CB5: 0D63561A33F958A5FE7B593D28573F95FA00C25D2FAC6109E4CA3DA7BC45C3AFCACD7DF95DA8FC8BD5E8D9A59859A8B6F657401E1635F1D7CC7F00164DA146DAFE8445B8C89999728AA50765F7900637006720155ACF5028389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC86FF1B927F95F3316F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE7BEDDA301F84FD0E143847C11F186F3C59DAA53EE0834AAEE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRxVvDy3pXeo5i+rkqVejlg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

09.04.2024 06:08, Chen Ni пишет:
> Return platform_driver_register() in order to transfer the error if
> it fails.
> 
> Fixes: be7ecbd240b2 ("soc: fsl: qe: convert QE interrupt controller to platform_device")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


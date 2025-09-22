Return-Path: <linuxppc-dev+bounces-12509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C8B91DCA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 17:11:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVmlq5j5tz3cBW;
	Tue, 23 Sep 2025 01:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=66.163.186.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758553879;
	cv=none; b=Q5/J+LLVaknXPkcukVtFwRrspyi6CMOvMttZGI5eyXOUhEiRWmcDsMELdbeszNxSqVrmBQ+A+EF+WJrbIHkiYhy1MhjTkuZLZe13B/8YwCRLgk31fa//ImBJNeCpITsKOasraWpiB762O9IOqw593rSboyyyXX9a08K5XlsjWbEsZEiKrQoE9v8SatbUDb+DXk0/mH1J16Wxs2WcVccQqmpOGSBeAi2Dw+s6fS7WyGW+P/GgwiW6XmgMWQgVgVkYd5uXf7hHLU9Z1x0QEdJLQZ6kMHTB4Jc19kbBUnZXHxjbX05XDqd40Dz7sAKzI4Uus0czAegCAgvWegfICSP2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758553879; c=relaxed/relaxed;
	bh=4InEgJCpBgl3urehuyUAnpN3vmaPh6mhZWLVpIhzL0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jV0dCEpHs9qDDWSxy2IFFaUc5ZXMfaPQ3P280TtFNvhF64tJOfUDnBfHiOqmS1mVTBIl9/wXCmMVb894hSijOMDAP35l4nHCIl+uh/IkBqEhrk9WHk7n2LYW3gDprMEWYm5uezAxGr/mdJRbsLnIJPLsUqy/enneZzlZw/btW1tU+EI23CX9NpsPfsQFGXnQ+mEH1mAf8VxnmJIMq4gSioyxiTvGzHfWkl4k+lcPbb+wswyg8mYxEFovOCRSuwofsduklKvu/9g1owhKa+nLEh61FeGloCRt32gahp/QcdzYh+o08DegcDP+VpSVj73bHzHtoTENfE9OAFrUAmtUvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=J9DwI9EE; dkim-atps=neutral; spf=none (client-ip=66.163.186.153; helo=sonic302-27.consmr.mail.ne1.yahoo.com; envelope-from=casey@schaufler-ca.com; receiver=lists.ozlabs.org) smtp.mailfrom=schaufler-ca.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=J9DwI9EE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=schaufler-ca.com (client-ip=66.163.186.153; helo=sonic302-27.consmr.mail.ne1.yahoo.com; envelope-from=casey@schaufler-ca.com; receiver=lists.ozlabs.org)
Received: from sonic302-27.consmr.mail.ne1.yahoo.com (sonic302-27.consmr.mail.ne1.yahoo.com [66.163.186.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVmlp0VPwz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 01:11:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1758553874; bh=4InEgJCpBgl3urehuyUAnpN3vmaPh6mhZWLVpIhzL0s=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=J9DwI9EEoSSW/Lkrr72eSxtrXRRENkjzKi46wW+Sysdd5SAjSVeIV4hgsLSA+JggqGnnt2M9wh7N0MfEiHO2gJR8amsnXUNwHU1/2ki/mr2IbJS4SpuLz1N4Ypj6XtaVdAeHXL/Lbikc+EMiYIhoLSVZuSWehpzhAhFZmcItDq2W3vUCwT+dafBVcOmnYNF/F9ZELG3HfEXIRpHiUwbwDCG6DBBbP6QhGUeVn79618epXSbHiu8hzGhRZGMDKocstCp6uOTE6S62y8udiG8HI5Jrkm0BxRWAChR1b+rKbQp5pV2+BMMabI9y2BAi0RsHcuI4RhQi+MNRhgXIiQFgRQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1758553874; bh=KPwtAbCxygioSedyi/zH4YiPp0McrAJ3B+cmGMWen8n=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=cNlIa+GgmUR4wuvMfIB8WqyYSEX08UMsLE+92KlNC2P/yka3ghVo6hU6YPEvjWL7fZFQUrO417uXOMvZwUAAH5hPqAIf9OzZM7Y39W9y2lcROyU0QToz5a5oJ5P1XGaPPcS58kY7N9vBtO6BQy9pNgIajYzJzO+hDYaUQWmfIhbgs7fRs7yv3gccc/svi7WlbGkbhDWwXa5d/jiY7dZH4E9mjchUAMbc6RCC63G/iiv6KwRqdM87luBlAFkvsVRS7vcQNq6Mq6sV5lCRyhW96NiPuZHLcdSbcVzkpQ+92kvkzDPWEFKS09KgIrOIib74OlO030E1+1YptjS8yNSj/Q==
X-YMail-OSG: a0ShGM0VM1kS5TdAKyhzMZn1kR2BVScsxCyqUC96KXfqWNmQ7dmcDUkr2C6CD8o
 F.nNwGtrFxyWKgcaKU7c7SzY5sLRNB.kOmj5_1Qm6ugm1qKEKbdGmcF7HD5CS6uaMhzE.a9se2Qm
 F1aP8aIzBCHkxN5RNu9eVRSUSnetYV4eQU1XVm4hTaEV4BvxehZwefxFMd6x0JG.j4dEDQi93AD1
 otuyzSX1.GPHdlyHguPAligClB4vPQXogx4pmPFUNZvIgnYUj3ZAP.eaGvtLAJBWwJZIid7F8Yl7
 fS1HoQ7Jn3KoiQxx99h22rBrZa75BNGmyO0gktHMEZP6MXXhe53TSWat_vR8FAYXp_VD4R4oJuz0
 DW.oPlaIk1ghcJ.KbdLt0LsHV4.48F61tmZEA3FvDg6dnsPKuRGJnMhywRU4K6.kIxo9YPvXQjHB
 F0IEgZLPfOcJ8vj_r5t6ph71MsJq.FE_dJwSDuVWC2OfTIwu3UL950I4YXO0txdngQH3weqQJq6v
 Gd0etDBRenLr.nP4ZVooL08C.kalSnyjilbjQ6hVCbAJFQ5ac5tNMA0yqzDKczYaots_sFff8rvv
 U5vBtTDHFGj9pG1htEk98Bie3Sr1Rh3DfjslgmdEQKnh1_RrMAZSOAa.07QtYLdpDe2ASHqoxstq
 qYaXJgEdH5PCYA35nG5kb60ezbJkPPwOgISysqsYtBczyL7aM0o_YWb87zjEpMrncOBftQRPUxzI
 yY2X1SAcAlN74EUshXhNxN7bDz0fJ9pyw6Z2FsRjy8NP0ZZgh77q88u5.20P4ilTVK7xnx3zwYf4
 Uzh2YFJ6lpxu_av3Ty_RSjjqPs_hrHqzS4E2lP1u8zR0J5nKWFZkiuKSJTrN8DJgClAmJqKAahC0
 NDUnpko2yADSzuuEpuBlBsqp8tv6uhW8teFJt.gLBrwD3pm5T1jSk.0wbeWpfWdlekkEEZwV3NPS
 xZ7VgGeoZC1jxaMek4SWmhHxcE34bMEKU.ZgnVDtv1vB2BQqLi_s6d77dWDiquPUaQAUCXKkMaQP
 uhDhqmwm8pzBqj2r0bYaLSBcqFrAk51e5s4ikqTrwey9HRuUMMB8Eh2Y1HQR9LL_GE.p6iKBKxnX
 nIXVe7cgbeMhuuSyEyhK5k_DGnSaPAqBjwhWbkQQ0EBc3l6dBpb4.Oz6IoO_8WCoLqoiiNyfdai.
 bJqa6nOKQrPDM66mVqWCrlXJ6g1wtUV7f9_RR3ivDzll782rXlyXthQ7MUGtc1O4ztwW9feR0AFR
 uC4vfcZi7p42Pwj2PiMqaKleTA3XAs8ovvKSBT_szRVp_5si5CjN8VyeemuMZTkLEg.rLNOiNPCG
 ytsLPAaDfYvVFrPfcdyYVnIQ2F2svsSmcLS6d07AwqKDkUlZFTirlX5SPJb30aKtLsfZA2vXA1dX
 byb6p2XV5WARbEoql4FkflHp67betBxxYfMoBuk5wsBX.R08duRAeIA7ywEmn2K_jb6_P91vCYMA
 AbckozoJFCLrgV6CWtns8rSzy395xhacTQzNQERJ8u6dQJMrmDYQtaS9J7y33Fwf1vHuWoK09FpM
 l8kJwIWULCnK5tjBv7iWW6LyslPyakaCL6mla8FXtIRDOQbAeGbSfW1aSxgcC89DZHcc2bM0x8e5
 sBoSsKO.AGS65jFjJYffvA9clbSmTISPOj4t64jG0sZpeeCe8VIxXz7WWTqU0XxkmCWiYwIn6KV_
 aUtD_EmSIWjW.J3jq2SVufM16hzqmUzhgU1aFQiACBwp.U2rG._edaOcsQrGJYKlS8tWmS4PL22D
 jSQIOAzuGq548u_mkww0AMgNAVQvlG67kcZ6SNXiFjW.k5iAUl1TlfCPEdCqsi8GWQRdneOBomfT
 ueajbwUt99M2nKlAjWvxQ_hy0RWGK3Ij4TWwNUYFNIsCXb0AsEOgYljPYO3dSJ0UbJwD6wzpABrG
 yZP5OsJLBK6ojQjJFmlGDMCbP7c5vxhge0mlgEPh6ACFt6Pqodho68OWazPnWVRIDSME785Zll_g
 CCQ9BuMOs.kMWTm4pGh28YO3BgmPcOl4hV.JK8XCiEgQY.4EQko2_W9u3bFfLa.Rdf_KvchZbSnR
 YcjkZQL3Gjhl21R0v_mm0v7UmSWebJxuIgVF4JOQehB9F_WNlcDfoawNwAtelzKXFXTaFRp_C6wK
 eszOxCUPqTPOQ_dI8MUlSoTR6Ga9y3m4NFIPKfqe_INBR5CwIx2F23bdEgas1vlI64GNmzsihuP2
 lxI_3RbdGVHuDr69RVlRtRbANidYaUSGf53wBBeZlpqudBL7u_btetqsP2Keq_y6GEDrgR_icQFg
 BgrZFVqwNWg479To-
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 2c354591-3949-4080-84f2-5cc1785b2062
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Mon, 22 Sep 2025 15:11:14 +0000
Received: by hermes--production-gq1-6f9f7cb74b-2n2jr (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5a83043d0b8f6a0e34f3bfd1c61ea603;
          Mon, 22 Sep 2025 15:11:07 +0000 (UTC)
Message-ID: <8403fd9a-6667-4202-bd5b-5e83172961b3@schaufler-ca.com>
Date: Mon, 22 Sep 2025 08:11:05 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/39] convert smackfs
To: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
 raven@themaw.net, miklos@szeredi.hu, a.hindborg@kernel.org,
 linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, paul@paul-moore.com,
 linuxppc-dev@lists.ozlabs.org, borntraeger@linux.ibm.com,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20250920074156.GK39973@ZenIV>
 <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
 <20250920074759.3564072-10-viro@zeniv.linux.org.uk>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20250920074759.3564072-10-viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.24425 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/20/2025 12:47 AM, Al Viro wrote:
> Entirely static tree populated by simple_fill_super().  Can use
> kill_anon_super() as-is.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Looks fine to me.
Acked-by: Casey Schaufler <casey@schaufler-ca.com>

> ---
>  security/smack/smackfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index b1e5e62f5cbd..e989ae3890c7 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -2960,7 +2960,7 @@ static int smk_init_fs_context(struct fs_context *fc)
>  static struct file_system_type smk_fs_type = {
>  	.name		= "smackfs",
>  	.init_fs_context = smk_init_fs_context,
> -	.kill_sb	= kill_litter_super,
> +	.kill_sb	= kill_anon_super,
>  };
>  
>  static struct vfsmount *smackfs_mount;


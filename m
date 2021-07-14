Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED03C88F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 18:47:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQ3Mm71Zqz3097
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 02:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ3ML01vyz2yyv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 02:47:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GQ3M84JMBzB8Hs;
 Wed, 14 Jul 2021 18:47:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IiR9O4UV1kh; Wed, 14 Jul 2021 18:47:16 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GQ3M82K49zB84P;
 Wed, 14 Jul 2021 18:47:16 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 3FAD3638; Wed, 14 Jul 2021 18:52:24 +0200 (CEST)
Received: from 37.164.227.125 ([37.164.227.125]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Wed, 14 Jul 2021 18:52:24 +0200
Date: Wed, 14 Jul 2021 18:52:24 +0200
Message-ID: <20210714185224.Horde.SuBZAzTXvfB6J6HsqQkOog6@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Yi Zhuang <zhuangyi1@huawei.com>
Subject: Re: [PATCH v2] powerpc/rtas_flash: fix a potential buffer overflow
In-Reply-To: <20210714122753.76021-1-zhuangyi1@huawei.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: hegdevasant@linux.vnet.ibm.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yi Zhuang <zhuangyi1@huawei.com> a =C3=A9crit=C2=A0:

> Since snprintf() returns the possible output size instead of the
> actual output size, the available flash_msg length returned by
> get_validate_flash_msg may exceed the given buffer limit when
> simple_read_from_buffer calls copy_to_user
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: a94a14720eaf5 powerpc/rtas_flash: Fix validate_flash buffer=20=20
>=20overflow issue
> Signed-off-by: Yi Zhuang <zhuangyi1@huawei.com>
> ---
>  arch/powerpc/kernel/rtas_flash.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/rtas_flash.c=20=20
>=20b/arch/powerpc/kernel/rtas_flash.c
> index a99179d83538..062f0724c2ff 100644
> --- a/arch/powerpc/kernel/rtas_flash.c
> +++ b/arch/powerpc/kernel/rtas_flash.c
> @@ -470,9 +470,14 @@ static int get_validate_flash_msg(struct=20=20
>=20rtas_validate_flash_t *args_buf,
>  	if (args_buf->status >=3D VALIDATE_TMP_UPDATE) {
>  		n =3D sprintf(msg, "%d\n", args_buf->update_results);
>  		if ((args_buf->update_results >=3D VALIDATE_CUR_UNKNOWN) ||
> -		    (args_buf->update_results =3D=3D VALIDATE_TMP_UPDATE))
> +		    (args_buf->update_results =3D=3D VALIDATE_TMP_UPDATE)) {
>  			n +=3D snprintf(msg + n, msglen - n, "%s\n",
>  					args_buf->buf);
> +			if (n >=3D msglen) {

n cannot be greater than msglen


> +				n =3D msglen;
> +				printk(KERN_ERR "FLASH: msg too long.\n");
> +			}
> +		}
>  	} else {
>  		n =3D sprintf(msg, "%d\n", args_buf->status);
>  	}
> --
> 2.26.0.106.g9fadedd



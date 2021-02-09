Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D08643145E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:57:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZQxd0dDnzDvVh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:57:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uCfNU5kT; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZQvh6GZ9zDvVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 12:55:27 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id t25so11484128pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 17:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=QsCwawODcxjlO4jUKpOGRvI9GaVChN5YQwyqJ8ZYmkg=;
 b=uCfNU5kTvwnqxIov7wPNNQrypxuiGivgd6gK3/jX1eceSL5MuOsMJvceKT60+sskdT
 a64vMD254wCrng5vcirgPW0enMYEOhB2w7E6zw4jICFt5+WJJa1LttqqEDM2aZOctv8m
 p0g7B3Ju2LBtX4MZfAa7SpNQqB93QuB5hQr+qix54djRy6ZyAEl78Y7CTt7YeBu1W+qO
 0j1TOHCSPA/JSFrc9acu1OTcLnPTxi6yGntbdx12SZKdR88H4iYwPyJ1L10VgHynenNg
 FUoU+MdQINoydVqGqOaIkmMZVmQ5D57+6nOCkoPcF2j9/xpopcTC661kX7cY/1elzFj9
 ZjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QsCwawODcxjlO4jUKpOGRvI9GaVChN5YQwyqJ8ZYmkg=;
 b=Z8AayElTQPqGA0GAwMK4RLnAQFE/tt1gFHPRtKNojZz9kifsHBab3kydEhPUYzFbpn
 9MXr2WDLiYqZ6VVnHP/Hu1WtsRsjVMqGqMEgnXF2V/l1YsifUP+dXuEGNbUMlPG5Pxp6
 IC2CJn0eXePeneTh2tGLi1fg+BWLK2Of8YefjLntXrj26BiHViC8cQIsTox2XspEOd2+
 1HhERF3b5gz9ZJhmV7eIKno7n3hI+D81aMgUBFuGfGgvLIKnjWsF1gX4aKMJCNvbdb2N
 7OgcxqnjzZe7TjLmpQ5CIaEcIX74GwKISIMf2GVvVhOTED9E+nIx4TuObM3W9dyb1nk+
 3NmQ==
X-Gm-Message-State: AOAM533FctT1UVe04B694tiqkEdRm69ltj2AYd+clxbFFddMwpjdj0GJ
 IxyMC1MpFJuJeCAWeszdqO0=
X-Google-Smtp-Source: ABdhPJxc5UUhGe86v5+GGE9sj6/g4WIimdEMU2KrwxQxO5oZ2IbqGGPXVk7baclZHZCxQiUxTqpgzA==
X-Received: by 2002:a62:7a0b:0:b029:1de:7e70:955d with SMTP id
 v11-20020a627a0b0000b02901de7e70955dmr5523733pfc.49.1612835724043; 
 Mon, 08 Feb 2021 17:55:24 -0800 (PST)
Received: from localhost ([220.240.226.199])
 by smtp.gmail.com with ESMTPSA id l2sm514903pju.25.2021.02.08.17.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:55:23 -0800 (PST)
Date: Tue, 09 Feb 2021 11:55:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 16/22] powerpc/syscall: Avoid stack frame in likely
 part of system_call_exception()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <981edfd50d4c980634b74c4bb76b765c499a87ec.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <981edfd50d4c980634b74c4bb76b765c499a87ec.1612796617.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612834634.qle1lc7n6y.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
> When r3 is not modified, reload it from regs->orig_r3 to free
> volatile registers. This avoids a stack frame for the likely part
> of system_call_exception()

This doesn't on my 64s build, but it does reduce one non volatile
register save/restore. With quite a bit more register pressure
reduction 64s can avoid the stack frame as well.

It's a cool trick but quite code and compiler specific so I don't know=20
how worthwhile it is to keep considering we're calling out into random
kernel C code after this.

Maybe just keep it PPC32 specific for the moment, will have to do more
tuning for 64 and we have other stuff to do there first.

If you are happy to make it 32-bit only then

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Before the patch:
>=20
> c000b4d4 <system_call_exception>:
> c000b4d4:	7c 08 02 a6 	mflr    r0
> c000b4d8:	94 21 ff e0 	stwu    r1,-32(r1)
> c000b4dc:	93 e1 00 1c 	stw     r31,28(r1)
> c000b4e0:	90 01 00 24 	stw     r0,36(r1)
> c000b4e4:	90 6a 00 88 	stw     r3,136(r10)
> c000b4e8:	81 6a 00 84 	lwz     r11,132(r10)
> c000b4ec:	69 6b 00 02 	xori    r11,r11,2
> c000b4f0:	55 6b ff fe 	rlwinm  r11,r11,31,31,31
> c000b4f4:	0f 0b 00 00 	twnei   r11,0
> c000b4f8:	81 6a 00 a0 	lwz     r11,160(r10)
> c000b4fc:	55 6b 07 fe 	clrlwi  r11,r11,31
> c000b500:	0f 0b 00 00 	twnei   r11,0
> c000b504:	7c 0c 42 e6 	mftb    r0
> c000b508:	83 e2 00 08 	lwz     r31,8(r2)
> c000b50c:	81 82 00 28 	lwz     r12,40(r2)
> c000b510:	90 02 00 24 	stw     r0,36(r2)
> c000b514:	7d 8c f8 50 	subf    r12,r12,r31
> c000b518:	7c 0c 02 14 	add     r0,r12,r0
> c000b51c:	90 02 00 08 	stw     r0,8(r2)
> c000b520:	7c 10 13 a6 	mtspr   80,r0
> c000b524:	81 62 00 70 	lwz     r11,112(r2)
> c000b528:	71 60 86 91 	andi.   r0,r11,34449
> c000b52c:	40 82 00 34 	bne     c000b560 <system_call_exception+0x8c>
> c000b530:	2b 89 01 b6 	cmplwi  cr7,r9,438
> c000b534:	41 9d 00 64 	bgt     cr7,c000b598 <system_call_exception+0xc4>
> c000b538:	3d 40 c0 5c 	lis     r10,-16292
> c000b53c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
> c000b540:	39 4a 41 e8 	addi    r10,r10,16872
> c000b544:	80 01 00 24 	lwz     r0,36(r1)
> c000b548:	7d 2a 48 2e 	lwzx    r9,r10,r9
> c000b54c:	7c 08 03 a6 	mtlr    r0
> c000b550:	7d 29 03 a6 	mtctr   r9
> c000b554:	83 e1 00 1c 	lwz     r31,28(r1)
> c000b558:	38 21 00 20 	addi    r1,r1,32
> c000b55c:	4e 80 04 20 	bctr
>=20
> After the patch:
>=20
> c000b4d4 <system_call_exception>:
> c000b4d4:	81 6a 00 84 	lwz     r11,132(r10)
> c000b4d8:	90 6a 00 88 	stw     r3,136(r10)
> c000b4dc:	69 6b 00 02 	xori    r11,r11,2
> c000b4e0:	55 6b ff fe 	rlwinm  r11,r11,31,31,31
> c000b4e4:	0f 0b 00 00 	twnei   r11,0
> c000b4e8:	80 6a 00 a0 	lwz     r3,160(r10)
> c000b4ec:	54 63 07 fe 	clrlwi  r3,r3,31
> c000b4f0:	0f 03 00 00 	twnei   r3,0
> c000b4f4:	7d 6c 42 e6 	mftb    r11
> c000b4f8:	81 82 00 08 	lwz     r12,8(r2)
> c000b4fc:	80 02 00 28 	lwz     r0,40(r2)
> c000b500:	91 62 00 24 	stw     r11,36(r2)
> c000b504:	7c 00 60 50 	subf    r0,r0,r12
> c000b508:	7d 60 5a 14 	add     r11,r0,r11
> c000b50c:	91 62 00 08 	stw     r11,8(r2)
> c000b510:	7c 10 13 a6 	mtspr   80,r0
> c000b514:	80 62 00 70 	lwz     r3,112(r2)
> c000b518:	70 6b 86 91 	andi.   r11,r3,34449
> c000b51c:	40 82 00 28 	bne     c000b544 <system_call_exception+0x70>
> c000b520:	2b 89 01 b6 	cmplwi  cr7,r9,438
> c000b524:	41 9d 00 84 	bgt     cr7,c000b5a8 <system_call_exception+0xd4>
> c000b528:	80 6a 00 88 	lwz     r3,136(r10)
> c000b52c:	3d 40 c0 5c 	lis     r10,-16292
> c000b530:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
> c000b534:	39 4a 41 e4 	addi    r10,r10,16868
> c000b538:	7d 2a 48 2e 	lwzx    r9,r10,r9
> c000b53c:	7d 29 03 a6 	mtctr   r9
> c000b540:	4e 80 04 20 	bctr
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/interrupt.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 107ec39f05cb..205902052112 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -117,6 +117,9 @@ notrace long system_call_exception(long r3, long r4, =
long r5,
>  			return regs->gpr[3];
>  		}
>  		return -ENOSYS;
> +	} else {
> +		/* Restore r3 from orig_gpr3 to free up a volatile reg */
> +		r3 =3D regs->orig_gpr3;
>  	}
> =20
>  	/* May be faster to do array_index_nospec? */
> --=20
> 2.25.0
>=20
>=20

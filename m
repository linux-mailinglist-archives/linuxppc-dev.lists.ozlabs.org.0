Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2D18EFC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:25:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m4BC4FF9zDqYL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:25:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kxSRDBTF; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m47V5ZfNzDqnr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:23:02 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id g6so5506521plt.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 23:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=afu3GF6pVW3zkciHmOulhyjHTx5iHrcAVvPkq7PDhWo=;
 b=kxSRDBTFYHX3nx564LDoQj3dXvcy8sItgyVY2IeFJsCSgWT+i8dJpN+4Qr6O+q8DAe
 yNwqQP2VcYzGEyIvLBZpe8l3oE5VPiWAodJYCL3aju/e3vkQZqnl5IaqtV4u4kLqOUQN
 kEAH7zk+tYrbBwDboR7wd1HLU9let/cKho+MD65UodSmXLqMl+e7KI5qOYIiatRsbFPU
 yZFxVHnHNDoSIjen9cEB9tIqQ0IYcCzo9KdvJ+ZH87f7KZWLhCHvTknNZtMwxku9QrEl
 FVSaijr4PyhZpSe/YSultYq3J3pzTwmjjxGtAgNAAp01hQj+QAXn05574KPU7XOKzGym
 9vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=afu3GF6pVW3zkciHmOulhyjHTx5iHrcAVvPkq7PDhWo=;
 b=A76C7/xvBk9Oa76Mcouu3NXWdySXuOfmSo0rmPOY7YlfoEY9iNy/2VwPsq5lWepx9o
 WtnDbNlACBzn4HBHlEc+BvWXp1D4V06bHOzakr3a+cKa1F+7c4o0lJk5enHp2muzxph4
 1oyA5NA3qNI3VhB+8J1SxwfWN8jL5YT4jbBue6OwxP0TyrQu7qpgdfqyVjDJKC0J0Exc
 2cMCPN7JtymJ/DvJ+EP+aIW8Rgys+q8JIV+o3bnX0xGtYtOw+VeIZb1sj1bBfkAqVCYD
 X1igpK5G6d1S/n1uzpcVF2bDLrSBoPFCphsYxH3qJjW1WelYAUJocCXDe3kmt9KAAjb7
 3dXw==
X-Gm-Message-State: ANhLgQ0xPonSK0/otfqwE2zURZGF2FozRIpUuYnsS8OWbuf7fvbz7kOk
 YF5M+Rs7xwLzRczlGo/gcfo=
X-Google-Smtp-Source: ADFU+vtiqirQZtzEWe+d+aPmeuBudav6VhKZ3Oj3BCo4lSiw0mqNgkEyDc7Ew2gebdRS6zJxbTgqzw==
X-Received: by 2002:a17:902:b692:: with SMTP id
 c18mr20582623pls.7.1584944580298; 
 Sun, 22 Mar 2020 23:23:00 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i4sm12228368pfq.82.2020.03.22.23.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 23:22:59 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:19:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 01/16] powerpc/xmon: Remove store_inst() for
 patch_instruction()
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-2-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-2-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584944339.u0isoftv4t.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 20, 2020 3:17 pm:
> For modifying instructions in xmon, patch_instruction() can serve the
> same role that store_inst() is performing with the advantage of not
> being specific to xmon. In some places patch_instruction() is already
> being using followed by store_inst(). In these cases just remove the
> store_inst(). Otherwise replace store_inst() with patch_instruction().

LGTM

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: Read into a local variable
> ---
>  arch/powerpc/xmon/xmon.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index e8c84d265602..02e3bd62cab4 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -325,11 +325,6 @@ static inline void sync(void)
>  	asm volatile("sync; isync");
>  }
> =20
> -static inline void store_inst(void *p)
> -{
> -	asm volatile ("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r" (p));
> -}
> -
>  static inline void cflush(void *p)
>  {
>  	asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
> @@ -881,8 +876,7 @@ static struct bpt *new_breakpoint(unsigned long a)
>  	for (bp =3D bpts; bp < &bpts[NBPTS]; ++bp) {
>  		if (!bp->enabled && atomic_read(&bp->ref_count) =3D=3D 0) {
>  			bp->address =3D a;
> -			bp->instr[1] =3D bpinstr;
> -			store_inst(&bp->instr[1]);
> +			patch_instruction(&bp->instr[1], bpinstr);
>  			return bp;
>  		}
>  	}
> @@ -894,25 +888,26 @@ static struct bpt *new_breakpoint(unsigned long a)
>  static void insert_bpts(void)
>  {
>  	int i;
> +	unsigned int instr;
>  	struct bpt *bp;
> =20
>  	bp =3D bpts;
>  	for (i =3D 0; i < NBPTS; ++i, ++bp) {
>  		if ((bp->enabled & (BP_TRAP|BP_CIABR)) =3D=3D 0)
>  			continue;
> -		if (mread(bp->address, &bp->instr[0], 4) !=3D 4) {
> +		if (mread(bp->address, &instr, 4) !=3D 4) {
>  			printf("Couldn't read instruction at %lx, "
>  			       "disabling breakpoint there\n", bp->address);
>  			bp->enabled =3D 0;
>  			continue;
>  		}
> -		if (IS_MTMSRD(bp->instr[0]) || IS_RFID(bp->instr[0])) {
> +		if (IS_MTMSRD(instr) || IS_RFID(instr)) {
>  			printf("Breakpoint at %lx is on an mtmsrd or rfid "
>  			       "instruction, disabling it\n", bp->address);
>  			bp->enabled =3D 0;
>  			continue;
>  		}
> -		store_inst(&bp->instr[0]);
> +		patch_instruction(bp->instr, instr);
>  		if (bp->enabled & BP_CIABR)
>  			continue;
>  		if (patch_instruction((unsigned int *)bp->address,
> @@ -922,7 +917,6 @@ static void insert_bpts(void)
>  			bp->enabled &=3D ~BP_TRAP;
>  			continue;
>  		}
> -		store_inst((void *)bp->address);
>  	}
>  }
> =20
> @@ -957,8 +951,6 @@ static void remove_bpts(void)
>  			(unsigned int *)bp->address, bp->instr[0]) !=3D 0)
>  			printf("Couldn't remove breakpoint at %lx\n",
>  			       bp->address);
> -		else
> -			store_inst((void *)bp->address);
>  	}
>  }
> =20
> --=20
> 2.17.1
>=20
>=20
=

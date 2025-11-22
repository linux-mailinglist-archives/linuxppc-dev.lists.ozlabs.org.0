Return-Path: <linuxppc-dev+bounces-14423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C76C7CE70
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Nov 2025 12:33:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dD91p1Llgz2yvv;
	Sat, 22 Nov 2025 22:33:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763811182;
	cv=none; b=ZZVJdSzCNULN/tj8g3fFWZPmC71bq5p7Ek+OTc4ZvGXiwNugqx9n48V7bT9Cy0CeQ9+0a9W1hWBhUvQ89jjeXWSSgOniZhyNzbwNr3HetD7JM33nuXyMC4ML2IXDZPhj1Pl6v9aazQiXmnxLk5uo3F4xxFGK1K9n3PkYu22asWNGiXj0IBkMce6e2ZuCoBKvBikl41xm0Ay3znl+a7JAeijIi7IrEUbxsjH1Qjq8X4MzrRHVsyNECFA4aBQ/ousLL13Wgrt78tKqhpU2WwzrgYzLVCXxLcUblKRZJYzHioe2RFedG5JVcETTC+DlElvZ/Z09IoeLsrZlzA6J26I4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763811182; c=relaxed/relaxed;
	bh=ayrPlJz+Hm2R+56vL95rZVDdXkw7gLdLbFcYBd5a5bw=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=L8u2n9sHX+l47MsQZAXZm+ZxJ3EeSmrTssId6VO1CqTCjWPD2zP3k3ndC8Fe7DYjicrbJWh008avlRIBzd9GZHHunIAWYtcw7aojEPNFtJvKAYEAefG3hRKhd0RU94oVNNUfjIRRtgHOW2uc+7RVl4vUK8uCqEjyd4OB8fIwwe6pklph8oNSRGCRd/R/KFUBsWShI2jE3CQ781zmF8SQsquNUNWEipoBJ7D3S+YDfaWiERRh5CrwoDc2m3Nb9VXvJ+9BtOZGsa0nqnhQu0chCW7rykJKPi7n5dOGiAwM0BepQk+hYNs1MYVpdSC+Y0MJiGQEBTbbT9kJGGyES6kbKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CdxAwOLX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=manili.devteam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CdxAwOLX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=manili.devteam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dD91l6WF6z2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 22:32:58 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b29aebdf3cso48682885a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 03:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763811171; x=1764415971; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ayrPlJz+Hm2R+56vL95rZVDdXkw7gLdLbFcYBd5a5bw=;
        b=CdxAwOLXwcI7fyetrqaXJ6zAZ4EDqPRrjq/HOzulOeXo93fqbLeljZw4XfW7fcOiGb
         LZ95fHeji+YHyu75gSWW1ZjqmpK4mQAxdwHvIdAOsW+uDNVirjfwJ/xbKryd105SDL4y
         MkXfLTTVJWaHyYk6Z4/tpL01HMss2b/ZtGxHpFfh4DPueZvYj6vUZoCqpBDPSpiQzGUG
         BS+5Fk2fuk4nVXg6lf/T6UFplWzZteOtaCG1ZJNc7kjdWPcUGebNqGu93qvOGfvTSqiw
         uHJNj7eVFes85m5vBqrkvRSDyUeWQjudm+cRZxuTKX1OaSkwBunAJj4sgB2EFQRJQLAP
         H/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763811171; x=1764415971;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayrPlJz+Hm2R+56vL95rZVDdXkw7gLdLbFcYBd5a5bw=;
        b=pu0tTIhUsU5cvBIbvfa7QQdwz68TXnkjPGzpm8QDl6zRPOW3L60LdfXWN9iHyS7y4o
         S4tGjqZWkNghaDX7YePwZQKIF+vlpRx5UehczwKBIiC6mhNA4/mpnRiGgHO9i8kk3F7c
         psH0UhwVdKutWGGg9NN8c8CtpfWamTc5PFsacra1emO3HUG4FJ5AvaDTJlnARv20ZMrh
         mm2P9Eti/l07M4Cj8qu2JHO6MeYGPpixDFykZ9xA+jq6C4TXS4+nqVql4aya6HP8MhMv
         XqU1xBhFB4EkFRBnFF6rC1ochxKQUf4/aQFii3AjiIO4MMapgu/FI3sBeknnNYR5ZH8D
         nYjA==
X-Gm-Message-State: AOJu0YxvSi9JwMsvCntxLvLK0BphnOi+ZeUQG+i6tCY9eeATKG+tF8fH
	2++jOOiqqO4g1n6BbAXzsBZzjEME/VBAcVnABYX1ZHtDsO5e/Exvr7UcynwC4A==
X-Gm-Gg: ASbGnctT+0zofVxprO8eDzQ8WrXnUBIM8ayMV8hA8vCMalS8BFGbbtF3dqfn6EYF6Rc
	j2qaSAxRR1eBWhKJIStIN2nf9goJ1F5IvO/BkWeV/pReVHfMLqIoSkhtKxq4q9kShbyRE83jyu8
	Knb5VKeusJ0il2qYmJA53/M2lel8/EBYgFdlgntVYRPuf3f7hA7YThl51zOroQrTJYuJF6R1cK2
	+uemfjPamVQJHKAd8aIII+k9fKTOBZhZF6/euQVD88k0LWzcP+bDL613uVkj7uKz/AqPOFH2QTK
	jQlj7A5zax1yLs1QZgWKQZCetZdvYu9TCHKcLuiAm67d0OIOV3yZtJESInqkiaeKClgpUTZN20B
	BXQH74ZtHQI0EbPUugrfe7cVl5GFFy0WuvJ6rzdwASUMyT2vE2qJ/VZwLjziyLqEj0UJ41QFpoU
	6q62LNWP8N5lm0w/H+QVAN1xLpCmSSPGjj6VQJrTmxhNHEjd0BjlDw+K5A
X-Google-Smtp-Source: AGHT+IHZOHwcqypk2xFWgF8XZxPwuYYzrLHJT/LBvf/0haJDdSAj5DvfdNIOa17PEHeA7sShabjFQw==
X-Received: by 2002:ad4:5bc1:0:b0:880:4954:6af5 with SMTP id 6a1803df08f44-8847c53bb45mr58869196d6.7.1763811170685;
        Sat, 22 Nov 2025 03:32:50 -0800 (PST)
Received: from smtpclient.apple (ec2-3-87-7-19.compute-1.amazonaws.com. [3.87.7.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e484ebcsm57383276d6.23.2025.11.22.03.32.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Nov 2025 03:32:50 -0800 (PST)
From: Mohammad Amin Nili <manili.devteam@gmail.com>
Message-Id: <419F2465-DA4A-41AA-B5A6-5F87E30D661C@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_69BF0C82-16C0-4F57-BB12-6D3546D11E1A"
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
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: =?utf-8?Q?Re=3A_=5BHelp=5D_Microwatt_=28Zynqwatt=29_=E2=80=94_Ker?=
 =?utf-8?Q?nel_halts_after_Radix_MMU_init_on_booting_Linux_on_Zynq_version?=
 =?utf-8?Q?_of_Microwatt?=
Date: Sat, 22 Nov 2025 06:32:46 -0500
In-Reply-To: <CAOSf1CEqFVxaNetW_=gBZFnvn4Our8-gGSDUigWeaMc98Kg-yg@mail.gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
To: Oliver O'Halloran <oohall@gmail.com>
References: <AEFA6CA1-69CB-4248-9911-C0BDFB03DB56@gmail.com>
 <CAOSf1CEf41H4ynEQvszspTMKpq9vq0FnXy=qdk_-PUrZpJVwCg@mail.gmail.com>
 <CFB0E332-AB7C-4E70-BB8A-45BFD4EB9E18@gmail.com>
 <CAOSf1CEQPBrXBXkLkJ7o7VJYbrT1jXQDzqqe=FjRyKv62sfC0Q@mail.gmail.com>
 <0BCEC0A4-006A-487F-B3E8-8AA0ECB20B2D@gmail.com>
 <CAOSf1CEqFVxaNetW_=gBZFnvn4Our8-gGSDUigWeaMc98Kg-yg@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.15)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Apple-Mail=_69BF0C82-16C0-4F57-BB12-6D3546D11E1A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello Oliver,

> That's very odd. rcu_reclaim_tiny() is probably being folded into
> rcu_process_callbacks() by the compiler and the crash occurs when
> branching to the callback function from the rcu_head
> =
(https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/tiny.c#L95 =
<https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/tiny.c#L95>)=
.
> That said, the "callback" address it branched to (0xc00c000000000000)
> is actually the base of the vmemmap (i.e. the struct page array) so I
> doubt that's actually the callback address stored in the rcu_head. You
> can use xmon to dump the registers and examine memory to confirm this.
> It's hard to say why this is happening, but it's pretty likely to
> either be the compiler optimizing away code you'd prefer to keep or a
> bug in the core itself.
>=20
> I'd compare the disasm of rcu_process_callbacks() with and without
> your wait loop added and see how the emitted code changes. If adding
> the loop changes nothing then it might be a logic bug in microwatt
> itself or some other timing induced problem.

I just replaced the wait-loop with the following (and it also prevents =
the
kernel panic):

> 	volatile uint32_t dumb =3D 0xFEDC0000;
>	dumb++;

- Here is the disasm of the `rcu_process_callbacks` with the injected =
code:

c00000000008c5e8 <rcu_process_callbacks>:
c00000000008c5e8:       32 00 4c 3c     addis   r2,r12,50
c00000000008c5ec:       18 ca 42 38     addi    r2,r2,-13800
c00000000008c5f0:       a6 02 08 7c     mflr    r0
c00000000008c5f4:       a1 c3 23 48     bl      c0000000002c8994 =
<_savegpr0_27>
c00000000008c5f8:       a1 ff 21 f8     stdu    r1,-96(r1)
c00000000008c5fc:       fa 00 6d 88     lbz     r3,250(r13)
c00000000008c600:       01 00 69 60     ori     r9,r3,1
c00000000008c604:       fa 00 2d 99     stb     r9,250(r13)
c00000000008c608:       2b 01 42 3d     addis   r10,r2,299
c00000000008c60c:       2b 01 22 3d     addis   r9,r2,299
c00000000008c610:       d0 3c 4a e9     ld      r10,15568(r10)
c00000000008c614:       c8 3c 29 39     addi    r9,r9,15560
c00000000008c618:       00 48 2a 7c     cmpd    r10,r9
c00000000008c61c:       14 00 82 40     bne     c00000000008c630 =
<rcu_process_callbacks+0x48>
c00000000008c620:       6d d6 f8 4b     bl      c000000000019c8c =
<arch_local_irq_restore+0x8>
c00000000008c624:       00 00 00 60     nop
c00000000008c628:       60 00 21 38     addi    r1,r1,96
c00000000008c62c:       b8 c3 23 48     b       c0000000002c89e4 =
<_restgpr0_27>
c00000000008c630:       00 00 0a e9     ld      r8,0(r10)
c00000000008c634:       2b 01 e2 3c     addis   r7,r2,299
c00000000008c638:       c8 3c e7 eb     ld      r31,15560(r7)
c00000000008c63c:       c8 3c 07 f9     std     r8,15560(r7)
c00000000008c640:       00 00 00 39     li      r8,0
c00000000008c644:       00 00 0a f9     std     r8,0(r10)
c00000000008c648:       2b 01 42 3d     addis   r10,r2,299
c00000000008c64c:       d8 3c 0a e9     ld      r8,15576(r10)
c00000000008c650:       2b 01 42 3d     addis   r10,r2,299
c00000000008c654:       d0 3c 4a e9     ld      r10,15568(r10)
c00000000008c658:       00 50 28 7c     cmpd    r8,r10
c00000000008c65c:       08 00 82 40     bne     c00000000008c664 =
<rcu_process_callbacks+0x7c>
c00000000008c660:       10 00 29 f9     std     r9,16(r9)
c00000000008c664:       08 00 29 f9     std     r9,8(r9)
c00000000008c668:       dc fe 80 3f     lis     r28,-292 <<<<=3D=3D=3D=3D=3D=
=3D "THIS IS INJECTED CODE"
c00000000008c66c:       21 d6 f8 4b     bl      c000000000019c8c =
<arch_local_irq_restore+0x8>
c00000000008c670:       00 00 00 60     nop
c00000000008c674:       00 00 60 3b     li      r27,0
c00000000008c678:       00 00 3f 2c     cmpdi   r31,0
c00000000008c67c:       ac ff 82 41     beq     c00000000008c628 =
<rcu_process_callbacks+0x40>
c00000000008c680:       00 00 df eb     ld      r30,0(r31)
c00000000008c684:       00 00 3e 2c     cmpdi   r30,0
c00000000008c688:       08 00 82 41     beq     c00000000008c690 =
<rcu_process_callbacks+0xa8>
c00000000008c68c:       2c f2 00 7c     dcbtct  0,r30
c00000000008c690:       2c 00 81 93     stw     r28,44(r1)
c00000000008c694:       08 00 bf eb     ld      r29,8(r31)
c00000000008c698:       00 00 3d 2c     cmpdi   r29,0
c00000000008c69c:       2c 00 21 81     lwz     r9,44(r1)
c00000000008c6a0:       01 00 29 39     addi    r9,r9,1
c00000000008c6a4:       2c 00 21 91     stw     r9,44(r1)
c00000000008c6a8:       10 00 82 40     bne     c00000000008c6b8 =
<rcu_process_callbacks+0xd0>
c00000000008c6ac:       78 fb e3 7f     mr      r3,r31
c00000000008c6b0:       15 f8 03 48     bl      c0000000000cbec4 =
<kmem_dump_obj+0x8>
c00000000008c6b4:       00 00 00 60     nop
c00000000008c6b8:       08 00 7f fb     std     r27,8(r31)
c00000000008c6bc:       78 fb e3 7f     mr      r3,r31
c00000000008c6c0:       a6 03 a9 7f     mtctr   r29
c00000000008c6c4:       78 eb ac 7f     mr      r12,r29
c00000000008c6c8:       18 00 41 f8     std     r2,24(r1)
c00000000008c6cc:       78 f3 df 7f     mr      r31,r30
c00000000008c6d0:       21 04 80 4e     bctrl
c00000000008c6d4:       18 00 41 e8     ld      r2,24(r1)
c00000000008c6d8:       a0 ff ff 4b     b       c00000000008c678 =
<rcu_process_callbacks+0x90>

- And here is the disasm without the injected code:

c00000000008c5e8 <rcu_process_callbacks>:
c00000000008c5e8:       32 00 4c 3c     addis   r2,r12,50
c00000000008c5ec:       18 ca 42 38     addi    r2,r2,-13800
c00000000008c5f0:       a6 02 08 7c     mflr    r0
c00000000008c5f4:       95 c3 23 48     bl      c0000000002c8988 =
<_savegpr0_28>
c00000000008c5f8:       c1 ff 21 f8     stdu    r1,-64(r1)
c00000000008c5fc:       fa 00 6d 88     lbz     r3,250(r13)
c00000000008c600:       01 00 69 60     ori     r9,r3,1
c00000000008c604:       fa 00 2d 99     stb     r9,250(r13)
c00000000008c608:       2b 01 42 3d     addis   r10,r2,299
c00000000008c60c:       2b 01 22 3d     addis   r9,r2,299
c00000000008c610:       d0 3c 4a e9     ld      r10,15568(r10)
c00000000008c614:       c8 3c 29 39     addi    r9,r9,15560
c00000000008c618:       00 48 2a 7c     cmpd    r10,r9
c00000000008c61c:       14 00 82 40     bne     c00000000008c630 =
<rcu_process_callbacks+0x48>
c00000000008c620:       6d d6 f8 4b     bl      c000000000019c8c =
<arch_local_irq_restore+0x8>
c00000000008c624:       00 00 00 60     nop
c00000000008c628:       40 00 21 38     addi    r1,r1,64
c00000000008c62c:       ac c3 23 48     b       c0000000002c89d8 =
<_restgpr0_28>
c00000000008c630:       00 00 0a e9     ld      r8,0(r10)
c00000000008c634:       2b 01 e2 3c     addis   r7,r2,299
c00000000008c638:       c8 3c e7 eb     ld      r31,15560(r7)
c00000000008c63c:       c8 3c 07 f9     std     r8,15560(r7)
c00000000008c640:       00 00 00 39     li      r8,0
c00000000008c644:       00 00 0a f9     std     r8,0(r10)
c00000000008c648:       2b 01 42 3d     addis   r10,r2,299
c00000000008c64c:       d8 3c 0a e9     ld      r8,15576(r10)
c00000000008c650:       2b 01 42 3d     addis   r10,r2,299
c00000000008c654:       d0 3c 4a e9     ld      r10,15568(r10)
c00000000008c658:       00 50 28 7c     cmpd    r8,r10
c00000000008c65c:       08 00 82 40     bne     c00000000008c664 =
<rcu_process_callbacks+0x7c>
c00000000008c660:       10 00 29 f9     std     r9,16(r9)
c00000000008c664:       08 00 29 f9     std     r9,8(r9)
c00000000008c668:       00 00 80 3b     li      r28,0
c00000000008c66c:       21 d6 f8 4b     bl      c000000000019c8c =
<arch_local_irq_restore+0x8>
c00000000008c670:       00 00 00 60     nop
c00000000008c674:       00 00 3f 2c     cmpdi   r31,0
c00000000008c678:       b0 ff 82 41     beq     c00000000008c628 =
<rcu_process_callbacks+0x40>
c00000000008c67c:       00 00 df eb     ld      r30,0(r31)
c00000000008c680:       00 00 3e 2c     cmpdi   r30,0
c00000000008c684:       08 00 82 41     beq     c00000000008c68c =
<rcu_process_callbacks+0xa4>
c00000000008c688:       2c f2 00 7c     dcbtct  0,r30
c00000000008c68c:       08 00 bf eb     ld      r29,8(r31)
c00000000008c690:       00 00 3d 2c     cmpdi   r29,0
c00000000008c694:       10 00 82 40     bne     c00000000008c6a4 =
<rcu_process_callbacks+0xbc>
c00000000008c698:       78 fb e3 7f     mr      r3,r31
c00000000008c69c:       19 f8 03 48     bl      c0000000000cbeb4 =
<kmem_dump_obj+0x8>
c00000000008c6a0:       00 00 00 60     nop
c00000000008c6a4:       08 00 9f fb     std     r28,8(r31)
c00000000008c6a8:       78 fb e3 7f     mr      r3,r31
c00000000008c6ac:       a6 03 a9 7f     mtctr   r29
c00000000008c6b0:       78 eb ac 7f     mr      r12,r29
c00000000008c6b4:       18 00 41 f8     std     r2,24(r1)
c00000000008c6b8:       78 f3 df 7f     mr      r31,r30
c00000000008c6bc:       21 04 80 4e     bctrl
c00000000008c6c0:       18 00 41 e8     ld      r2,24(r1)
c00000000008c6c4:       b0 ff ff 4b     b       c00000000008c674 =
<rcu_process_callbacks+0x8c>


Sounds like some sorta compiler optimizations, right?

Bests,
Manili=

--Apple-Mail=_69BF0C82-16C0-4F57-BB12-6D3546D11E1A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hello=
 Oliver,<div class=3D""><br class=3D""><div><blockquote type=3D"cite" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">That's very =
odd. rcu_reclaim_tiny() is probably being folded into</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">rcu_process_callbacks() by the =
compiler and the crash occurs when</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">branching to the callback function from the =
rcu_head</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">(</span><a =
href=3D"https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/tiny.=
c#L95" style=3D"font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/ti=
ny.c#L95</a><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">).</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">That said, the "callback" =
address it branched to (0xc00c000000000000)</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">is actually the base of the =
vmemmap (i.e. the struct page array) so I</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">doubt that's actually the callback address stored in the =
rcu_head. You</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">can use xmon =
to dump the registers and examine memory to confirm this.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">It's hard to say why this is =
happening, but it's pretty likely to</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">either be the compiler optimizing away code you'd prefer to =
keep or a</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">bug in the =
core itself.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I'd compare =
the disasm of rcu_process_callbacks() with and without</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">your wait loop added and see how =
the emitted code changes. If adding</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">the loop changes nothing then it might be a logic bug in =
microwatt</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">itself or =
some other timing induced problem.</span><br class=3D""></blockquote><br =
class=3D""></div><div>I just replaced the wait-loop with the following =
(and it also prevents the</div><div>kernel panic):</div><div><br =
class=3D""></div><div>&gt;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>volatile uint32_t dumb =3D =
0xFEDC0000;</div><div>&gt;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>dumb++;</div><br =
class=3D""></div><div class=3D"">- Here is the disasm of the `<span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">rcu_process_callbacks</span>` with the injected =
code:</div><div class=3D""><br class=3D""></div><div class=3D""><div =
class=3D"">c00000000008c5e8 &lt;rcu_process_callbacks&gt;:</div><div =
class=3D"">c00000000008c5e8: &nbsp; &nbsp; &nbsp; 32 00 4c 3c &nbsp; =
&nbsp; addis &nbsp; r2,r12,50</div><div class=3D"">c00000000008c5ec: =
&nbsp; &nbsp; &nbsp; 18 ca 42 38 &nbsp; &nbsp; addi &nbsp; =
&nbsp;r2,r2,-13800</div><div class=3D"">c00000000008c5f0: &nbsp; &nbsp; =
&nbsp; a6 02 08 7c &nbsp; &nbsp; mflr &nbsp; &nbsp;r0</div><div =
class=3D"">c00000000008c5f4: &nbsp; &nbsp; &nbsp; a1 c3 23 48 &nbsp; =
&nbsp; bl &nbsp; &nbsp; &nbsp;c0000000002c8994 =
&lt;_savegpr0_27&gt;</div><div class=3D"">c00000000008c5f8: &nbsp; =
&nbsp; &nbsp; a1 ff 21 f8 &nbsp; &nbsp; stdu &nbsp; =
&nbsp;r1,-96(r1)</div><div class=3D"">c00000000008c5fc: &nbsp; &nbsp; =
&nbsp; fa 00 6d 88 &nbsp; &nbsp; lbz &nbsp; &nbsp; r3,250(r13)</div><div =
class=3D"">c00000000008c600: &nbsp; &nbsp; &nbsp; 01 00 69 60 &nbsp; =
&nbsp; ori &nbsp; &nbsp; r9,r3,1</div><div class=3D"">c00000000008c604: =
&nbsp; &nbsp; &nbsp; fa 00 2d 99 &nbsp; &nbsp; stb &nbsp; &nbsp; =
r9,250(r13)</div><div class=3D"">c00000000008c608: &nbsp; &nbsp; &nbsp; =
2b 01 42 3d &nbsp; &nbsp; addis &nbsp; r10,r2,299</div><div =
class=3D"">c00000000008c60c: &nbsp; &nbsp; &nbsp; 2b 01 22 3d &nbsp; =
&nbsp; addis &nbsp; r9,r2,299</div><div class=3D"">c00000000008c610: =
&nbsp; &nbsp; &nbsp; d0 3c 4a e9 &nbsp; &nbsp; ld &nbsp; &nbsp; =
&nbsp;r10,15568(r10)</div><div class=3D"">c00000000008c614: &nbsp; =
&nbsp; &nbsp; c8 3c 29 39 &nbsp; &nbsp; addi &nbsp; =
&nbsp;r9,r9,15560</div><div class=3D"">c00000000008c618: &nbsp; &nbsp; =
&nbsp; 00 48 2a 7c &nbsp; &nbsp; cmpd &nbsp; &nbsp;r10,r9</div><div =
class=3D"">c00000000008c61c: &nbsp; &nbsp; &nbsp; 14 00 82 40 &nbsp; =
&nbsp; bne &nbsp; &nbsp; c00000000008c630 =
&lt;rcu_process_callbacks+0x48&gt;</div><div class=3D"">c00000000008c620: =
&nbsp; &nbsp; &nbsp; 6d d6 f8 4b &nbsp; &nbsp; bl &nbsp; &nbsp; =
&nbsp;c000000000019c8c &lt;arch_local_irq_restore+0x8&gt;</div><div =
class=3D"">c00000000008c624: &nbsp; &nbsp; &nbsp; 00 00 00 60 &nbsp; =
&nbsp; nop</div><div class=3D"">c00000000008c628: &nbsp; &nbsp; &nbsp; =
60 00 21 38 &nbsp; &nbsp; addi &nbsp; &nbsp;r1,r1,96</div><div =
class=3D"">c00000000008c62c: &nbsp; &nbsp; &nbsp; b8 c3 23 48 &nbsp; =
&nbsp; b &nbsp; &nbsp; &nbsp; c0000000002c89e4 =
&lt;_restgpr0_27&gt;</div><div class=3D"">c00000000008c630: &nbsp; =
&nbsp; &nbsp; 00 00 0a e9 &nbsp; &nbsp; ld &nbsp; &nbsp; =
&nbsp;r8,0(r10)</div><div class=3D"">c00000000008c634: &nbsp; &nbsp; =
&nbsp; 2b 01 e2 3c &nbsp; &nbsp; addis &nbsp; r7,r2,299</div><div =
class=3D"">c00000000008c638: &nbsp; &nbsp; &nbsp; c8 3c e7 eb &nbsp; =
&nbsp; ld &nbsp; &nbsp; &nbsp;r31,15560(r7)</div><div =
class=3D"">c00000000008c63c: &nbsp; &nbsp; &nbsp; c8 3c 07 f9 &nbsp; =
&nbsp; std &nbsp; &nbsp; r8,15560(r7)</div><div =
class=3D"">c00000000008c640: &nbsp; &nbsp; &nbsp; 00 00 00 39 &nbsp; =
&nbsp; li &nbsp; &nbsp; &nbsp;r8,0</div><div class=3D"">c00000000008c644: =
&nbsp; &nbsp; &nbsp; 00 00 0a f9 &nbsp; &nbsp; std &nbsp; &nbsp; =
r8,0(r10)</div><div class=3D"">c00000000008c648: &nbsp; &nbsp; &nbsp; 2b =
01 42 3d &nbsp; &nbsp; addis &nbsp; r10,r2,299</div><div =
class=3D"">c00000000008c64c: &nbsp; &nbsp; &nbsp; d8 3c 0a e9 &nbsp; =
&nbsp; ld &nbsp; &nbsp; &nbsp;r8,15576(r10)</div><div =
class=3D"">c00000000008c650: &nbsp; &nbsp; &nbsp; 2b 01 42 3d &nbsp; =
&nbsp; addis &nbsp; r10,r2,299</div><div class=3D"">c00000000008c654: =
&nbsp; &nbsp; &nbsp; d0 3c 4a e9 &nbsp; &nbsp; ld &nbsp; &nbsp; =
&nbsp;r10,15568(r10)</div><div class=3D"">c00000000008c658: &nbsp; =
&nbsp; &nbsp; 00 50 28 7c &nbsp; &nbsp; cmpd &nbsp; =
&nbsp;r8,r10</div><div class=3D"">c00000000008c65c: &nbsp; &nbsp; &nbsp; =
08 00 82 40 &nbsp; &nbsp; bne &nbsp; &nbsp; c00000000008c664 =
&lt;rcu_process_callbacks+0x7c&gt;</div><div class=3D"">c00000000008c660: =
&nbsp; &nbsp; &nbsp; 10 00 29 f9 &nbsp; &nbsp; std &nbsp; &nbsp; =
r9,16(r9)</div><div class=3D"">c00000000008c664: &nbsp; &nbsp; &nbsp; 08 =
00 29 f9 &nbsp; &nbsp; std &nbsp; &nbsp; r9,8(r9)</div><div =
class=3D"">c00000000008c668: &nbsp; &nbsp; &nbsp; dc fe 80 3f &nbsp; =
&nbsp; lis &nbsp; &nbsp; r28,-292 &lt;&lt;&lt;&lt;=3D=3D=3D=3D=3D=3D =
"THIS IS INJECTED CODE"</div><div class=3D"">c00000000008c66c: &nbsp; =
&nbsp; &nbsp; 21 d6 f8 4b &nbsp; &nbsp; bl &nbsp; &nbsp; =
&nbsp;c000000000019c8c &lt;arch_local_irq_restore+0x8&gt;</div><div =
class=3D"">c00000000008c670: &nbsp; &nbsp; &nbsp; 00 00 00 60 &nbsp; =
&nbsp; nop</div><div class=3D"">c00000000008c674: &nbsp; &nbsp; &nbsp; =
00 00 60 3b &nbsp; &nbsp; li &nbsp; &nbsp; &nbsp;r27,0</div><div =
class=3D"">c00000000008c678: &nbsp; &nbsp; &nbsp; 00 00 3f 2c &nbsp; =
&nbsp; cmpdi &nbsp; r31,0</div><div class=3D"">c00000000008c67c: &nbsp; =
&nbsp; &nbsp; ac ff 82 41 &nbsp; &nbsp; beq &nbsp; &nbsp; =
c00000000008c628 &lt;rcu_process_callbacks+0x40&gt;</div><div =
class=3D"">c00000000008c680: &nbsp; &nbsp; &nbsp; 00 00 df eb &nbsp; =
&nbsp; ld &nbsp; &nbsp; &nbsp;r30,0(r31)</div><div =
class=3D"">c00000000008c684: &nbsp; &nbsp; &nbsp; 00 00 3e 2c &nbsp; =
&nbsp; cmpdi &nbsp; r30,0</div><div class=3D"">c00000000008c688: &nbsp; =
&nbsp; &nbsp; 08 00 82 41 &nbsp; &nbsp; beq &nbsp; &nbsp; =
c00000000008c690 &lt;rcu_process_callbacks+0xa8&gt;</div><div =
class=3D"">c00000000008c68c: &nbsp; &nbsp; &nbsp; 2c f2 00 7c &nbsp; =
&nbsp; dcbtct &nbsp;0,r30</div><div class=3D"">c00000000008c690: &nbsp; =
&nbsp; &nbsp; 2c 00 81 93 &nbsp; &nbsp; stw &nbsp; &nbsp; =
r28,44(r1)</div><div class=3D"">c00000000008c694: &nbsp; &nbsp; &nbsp; =
08 00 bf eb &nbsp; &nbsp; ld &nbsp; &nbsp; &nbsp;r29,8(r31)</div><div =
class=3D"">c00000000008c698: &nbsp; &nbsp; &nbsp; 00 00 3d 2c &nbsp; =
&nbsp; cmpdi &nbsp; r29,0</div><div class=3D"">c00000000008c69c: &nbsp; =
&nbsp; &nbsp; 2c 00 21 81 &nbsp; &nbsp; lwz &nbsp; &nbsp; =
r9,44(r1)</div><div class=3D"">c00000000008c6a0: &nbsp; &nbsp; &nbsp; 01 =
00 29 39 &nbsp; &nbsp; addi &nbsp; &nbsp;r9,r9,1</div><div =
class=3D"">c00000000008c6a4: &nbsp; &nbsp; &nbsp; 2c 00 21 91 &nbsp; =
&nbsp; stw &nbsp; &nbsp; r9,44(r1)</div><div class=3D"">c00000000008c6a8: =
&nbsp; &nbsp; &nbsp; 10 00 82 40 &nbsp; &nbsp; bne &nbsp; &nbsp; =
c00000000008c6b8 &lt;rcu_process_callbacks+0xd0&gt;</div><div =
class=3D"">c00000000008c6ac: &nbsp; &nbsp; &nbsp; 78 fb e3 7f &nbsp; =
&nbsp; mr &nbsp; &nbsp; &nbsp;r3,r31</div><div =
class=3D"">c00000000008c6b0: &nbsp; &nbsp; &nbsp; 15 f8 03 48 &nbsp; =
&nbsp; bl &nbsp; &nbsp; &nbsp;c0000000000cbec4 =
&lt;kmem_dump_obj+0x8&gt;</div><div class=3D"">c00000000008c6b4: &nbsp; =
&nbsp; &nbsp; 00 00 00 60 &nbsp; &nbsp; nop</div><div =
class=3D"">c00000000008c6b8: &nbsp; &nbsp; &nbsp; 08 00 7f fb &nbsp; =
&nbsp; std &nbsp; &nbsp; r27,8(r31)</div><div class=3D"">c00000000008c6bc:=
 &nbsp; &nbsp; &nbsp; 78 fb e3 7f &nbsp; &nbsp; mr &nbsp; &nbsp; =
&nbsp;r3,r31</div><div class=3D"">c00000000008c6c0: &nbsp; &nbsp; &nbsp; =
a6 03 a9 7f &nbsp; &nbsp; mtctr &nbsp; r29</div><div =
class=3D"">c00000000008c6c4: &nbsp; &nbsp; &nbsp; 78 eb ac 7f &nbsp; =
&nbsp; mr &nbsp; &nbsp; &nbsp;r12,r29</div><div =
class=3D"">c00000000008c6c8: &nbsp; &nbsp; &nbsp; 18 00 41 f8 &nbsp; =
&nbsp; std &nbsp; &nbsp; r2,24(r1)</div><div class=3D"">c00000000008c6cc: =
&nbsp; &nbsp; &nbsp; 78 f3 df 7f &nbsp; &nbsp; mr &nbsp; &nbsp; =
&nbsp;r31,r30</div><div class=3D"">c00000000008c6d0: &nbsp; &nbsp; =
&nbsp; 21 04 80 4e &nbsp; &nbsp; bctrl</div><div =
class=3D"">c00000000008c6d4: &nbsp; &nbsp; &nbsp; 18 00 41 e8 &nbsp; =
&nbsp; ld &nbsp; &nbsp; &nbsp;r2,24(r1)</div><div =
class=3D"">c00000000008c6d8: &nbsp; &nbsp; &nbsp; a0 ff ff 4b &nbsp; =
&nbsp; b &nbsp; &nbsp; &nbsp; c00000000008c678 =
&lt;rcu_process_callbacks+0x90&gt;</div></div><div class=3D""><br =
class=3D""></div><div class=3D"">- And here is the disasm without the =
injected code:</div><div class=3D""><br class=3D""></div><div =
class=3D""><div class=3D"">c00000000008c5e8 =
&lt;rcu_process_callbacks&gt;:</div><div class=3D"">c00000000008c5e8: =
&nbsp; &nbsp; &nbsp; 32 00 4c 3c &nbsp; &nbsp; addis &nbsp; =
r2,r12,50</div><div class=3D"">c00000000008c5ec: &nbsp; &nbsp; &nbsp; 18 =
ca 42 38 &nbsp; &nbsp; addi &nbsp; &nbsp;r2,r2,-13800</div><div =
class=3D"">c00000000008c5f0: &nbsp; &nbsp; &nbsp; a6 02 08 7c &nbsp; =
&nbsp; mflr &nbsp; &nbsp;r0</div><div class=3D"">c00000000008c5f4: =
&nbsp; &nbsp; &nbsp; 95 c3 23 48 &nbsp; &nbsp; bl &nbsp; &nbsp; =
&nbsp;c0000000002c8988 &lt;_savegpr0_28&gt;</div><div =
class=3D"">c00000000008c5f8: &nbsp; &nbsp; &nbsp; c1 ff 21 f8 &nbsp; =
&nbsp; stdu &nbsp; &nbsp;r1,-64(r1)</div><div class=3D"">c00000000008c5fc:=
 &nbsp; &nbsp; &nbsp; fa 00 6d 88 &nbsp; &nbsp; lbz &nbsp; &nbsp; =
r3,250(r13)</div><div class=3D"">c00000000008c600: &nbsp; &nbsp; &nbsp; =
01 00 69 60 &nbsp; &nbsp; ori &nbsp; &nbsp; r9,r3,1</div><div =
class=3D"">c00000000008c604: &nbsp; &nbsp; &nbsp; fa 00 2d 99 &nbsp; =
&nbsp; stb &nbsp; &nbsp; r9,250(r13)</div><div =
class=3D"">c00000000008c608: &nbsp; &nbsp; &nbsp; 2b 01 42 3d &nbsp; =
&nbsp; addis &nbsp; r10,r2,299</div><div class=3D"">c00000000008c60c: =
&nbsp; &nbsp; &nbsp; 2b 01 22 3d &nbsp; &nbsp; addis &nbsp; =
r9,r2,299</div><div class=3D"">c00000000008c610: &nbsp; &nbsp; &nbsp; d0 =
3c 4a e9 &nbsp; &nbsp; ld &nbsp; &nbsp; &nbsp;r10,15568(r10)</div><div =
class=3D"">c00000000008c614: &nbsp; &nbsp; &nbsp; c8 3c 29 39 &nbsp; =
&nbsp; addi &nbsp; &nbsp;r9,r9,15560</div><div =
class=3D"">c00000000008c618: &nbsp; &nbsp; &nbsp; 00 48 2a 7c &nbsp; =
&nbsp; cmpd &nbsp; &nbsp;r10,r9</div><div class=3D"">c00000000008c61c: =
&nbsp; &nbsp; &nbsp; 14 00 82 40 &nbsp; &nbsp; bne &nbsp; &nbsp; =
c00000000008c630 &lt;rcu_process_callbacks+0x48&gt;</div><div =
class=3D"">c00000000008c620: &nbsp; &nbsp; &nbsp; 6d d6 f8 4b &nbsp; =
&nbsp; bl &nbsp; &nbsp; &nbsp;c000000000019c8c =
&lt;arch_local_irq_restore+0x8&gt;</div><div class=3D"">c00000000008c624: =
&nbsp; &nbsp; &nbsp; 00 00 00 60 &nbsp; &nbsp; nop</div><div =
class=3D"">c00000000008c628: &nbsp; &nbsp; &nbsp; 40 00 21 38 &nbsp; =
&nbsp; addi &nbsp; &nbsp;r1,r1,64</div><div class=3D"">c00000000008c62c: =
&nbsp; &nbsp; &nbsp; ac c3 23 48 &nbsp; &nbsp; b &nbsp; &nbsp; &nbsp; =
c0000000002c89d8 &lt;_restgpr0_28&gt;</div><div =
class=3D"">c00000000008c630: &nbsp; &nbsp; &nbsp; 00 00 0a e9 &nbsp; =
&nbsp; ld &nbsp; &nbsp; &nbsp;r8,0(r10)</div><div =
class=3D"">c00000000008c634: &nbsp; &nbsp; &nbsp; 2b 01 e2 3c &nbsp; =
&nbsp; addis &nbsp; r7,r2,299</div><div class=3D"">c00000000008c638: =
&nbsp; &nbsp; &nbsp; c8 3c e7 eb &nbsp; &nbsp; ld &nbsp; &nbsp; =
&nbsp;r31,15560(r7)</div><div class=3D"">c00000000008c63c: &nbsp; &nbsp; =
&nbsp; c8 3c 07 f9 &nbsp; &nbsp; std &nbsp; &nbsp; =
r8,15560(r7)</div><div class=3D"">c00000000008c640: &nbsp; &nbsp; &nbsp; =
00 00 00 39 &nbsp; &nbsp; li &nbsp; &nbsp; &nbsp;r8,0</div><div =
class=3D"">c00000000008c644: &nbsp; &nbsp; &nbsp; 00 00 0a f9 &nbsp; =
&nbsp; std &nbsp; &nbsp; r8,0(r10)</div><div class=3D"">c00000000008c648: =
&nbsp; &nbsp; &nbsp; 2b 01 42 3d &nbsp; &nbsp; addis &nbsp; =
r10,r2,299</div><div class=3D"">c00000000008c64c: &nbsp; &nbsp; &nbsp; =
d8 3c 0a e9 &nbsp; &nbsp; ld &nbsp; &nbsp; &nbsp;r8,15576(r10)</div><div =
class=3D"">c00000000008c650: &nbsp; &nbsp; &nbsp; 2b 01 42 3d &nbsp; =
&nbsp; addis &nbsp; r10,r2,299</div><div class=3D"">c00000000008c654: =
&nbsp; &nbsp; &nbsp; d0 3c 4a e9 &nbsp; &nbsp; ld &nbsp; &nbsp; =
&nbsp;r10,15568(r10)</div><div class=3D"">c00000000008c658: &nbsp; =
&nbsp; &nbsp; 00 50 28 7c &nbsp; &nbsp; cmpd &nbsp; =
&nbsp;r8,r10</div><div class=3D"">c00000000008c65c: &nbsp; &nbsp; &nbsp; =
08 00 82 40 &nbsp; &nbsp; bne &nbsp; &nbsp; c00000000008c664 =
&lt;rcu_process_callbacks+0x7c&gt;</div><div class=3D"">c00000000008c660: =
&nbsp; &nbsp; &nbsp; 10 00 29 f9 &nbsp; &nbsp; std &nbsp; &nbsp; =
r9,16(r9)</div><div class=3D"">c00000000008c664: &nbsp; &nbsp; &nbsp; 08 =
00 29 f9 &nbsp; &nbsp; std &nbsp; &nbsp; r9,8(r9)</div><div =
class=3D"">c00000000008c668: &nbsp; &nbsp; &nbsp; 00 00 80 3b &nbsp; =
&nbsp; li &nbsp; &nbsp; &nbsp;r28,0</div><div class=3D"">c00000000008c66c:=
 &nbsp; &nbsp; &nbsp; 21 d6 f8 4b &nbsp; &nbsp; bl &nbsp; &nbsp; =
&nbsp;c000000000019c8c &lt;arch_local_irq_restore+0x8&gt;</div><div =
class=3D"">c00000000008c670: &nbsp; &nbsp; &nbsp; 00 00 00 60 &nbsp; =
&nbsp; nop</div><div class=3D"">c00000000008c674: &nbsp; &nbsp; &nbsp; =
00 00 3f 2c &nbsp; &nbsp; cmpdi &nbsp; r31,0</div><div =
class=3D"">c00000000008c678: &nbsp; &nbsp; &nbsp; b0 ff 82 41 &nbsp; =
&nbsp; beq &nbsp; &nbsp; c00000000008c628 =
&lt;rcu_process_callbacks+0x40&gt;</div><div class=3D"">c00000000008c67c: =
&nbsp; &nbsp; &nbsp; 00 00 df eb &nbsp; &nbsp; ld &nbsp; &nbsp; =
&nbsp;r30,0(r31)</div><div class=3D"">c00000000008c680: &nbsp; &nbsp; =
&nbsp; 00 00 3e 2c &nbsp; &nbsp; cmpdi &nbsp; r30,0</div><div =
class=3D"">c00000000008c684: &nbsp; &nbsp; &nbsp; 08 00 82 41 &nbsp; =
&nbsp; beq &nbsp; &nbsp; c00000000008c68c =
&lt;rcu_process_callbacks+0xa4&gt;</div><div class=3D"">c00000000008c688: =
&nbsp; &nbsp; &nbsp; 2c f2 00 7c &nbsp; &nbsp; dcbtct =
&nbsp;0,r30</div><div class=3D"">c00000000008c68c: &nbsp; &nbsp; &nbsp; =
08 00 bf eb &nbsp; &nbsp; ld &nbsp; &nbsp; &nbsp;r29,8(r31)</div><div =
class=3D"">c00000000008c690: &nbsp; &nbsp; &nbsp; 00 00 3d 2c &nbsp; =
&nbsp; cmpdi &nbsp; r29,0</div><div class=3D"">c00000000008c694: &nbsp; =
&nbsp; &nbsp; 10 00 82 40 &nbsp; &nbsp; bne &nbsp; &nbsp; =
c00000000008c6a4 &lt;rcu_process_callbacks+0xbc&gt;</div><div =
class=3D"">c00000000008c698: &nbsp; &nbsp; &nbsp; 78 fb e3 7f &nbsp; =
&nbsp; mr &nbsp; &nbsp; &nbsp;r3,r31</div><div =
class=3D"">c00000000008c69c: &nbsp; &nbsp; &nbsp; 19 f8 03 48 &nbsp; =
&nbsp; bl &nbsp; &nbsp; &nbsp;c0000000000cbeb4 =
&lt;kmem_dump_obj+0x8&gt;</div><div class=3D"">c00000000008c6a0: &nbsp; =
&nbsp; &nbsp; 00 00 00 60 &nbsp; &nbsp; nop</div><div =
class=3D"">c00000000008c6a4: &nbsp; &nbsp; &nbsp; 08 00 9f fb &nbsp; =
&nbsp; std &nbsp; &nbsp; r28,8(r31)</div><div class=3D"">c00000000008c6a8:=
 &nbsp; &nbsp; &nbsp; 78 fb e3 7f &nbsp; &nbsp; mr &nbsp; &nbsp; =
&nbsp;r3,r31</div><div class=3D"">c00000000008c6ac: &nbsp; &nbsp; &nbsp; =
a6 03 a9 7f &nbsp; &nbsp; mtctr &nbsp; r29</div><div =
class=3D"">c00000000008c6b0: &nbsp; &nbsp; &nbsp; 78 eb ac 7f &nbsp; =
&nbsp; mr &nbsp; &nbsp; &nbsp;r12,r29</div><div =
class=3D"">c00000000008c6b4: &nbsp; &nbsp; &nbsp; 18 00 41 f8 &nbsp; =
&nbsp; std &nbsp; &nbsp; r2,24(r1)</div><div class=3D"">c00000000008c6b8: =
&nbsp; &nbsp; &nbsp; 78 f3 df 7f &nbsp; &nbsp; mr &nbsp; &nbsp; =
&nbsp;r31,r30</div><div class=3D"">c00000000008c6bc: &nbsp; &nbsp; =
&nbsp; 21 04 80 4e &nbsp; &nbsp; bctrl</div><div =
class=3D"">c00000000008c6c0: &nbsp; &nbsp; &nbsp; 18 00 41 e8 &nbsp; =
&nbsp; ld &nbsp; &nbsp; &nbsp;r2,24(r1)</div><div =
class=3D"">c00000000008c6c4: &nbsp; &nbsp; &nbsp; b0 ff ff 4b &nbsp; =
&nbsp; b &nbsp; &nbsp; &nbsp; c00000000008c674 =
&lt;rcu_process_callbacks+0x8c&gt;</div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">Sounds like some sorta compiler optimizations, =
right?</div></div><div class=3D""><br class=3D""></div><div =
class=3D"">Bests,</div><div class=3D"">Manili</div></body></html>=

--Apple-Mail=_69BF0C82-16C0-4F57-BB12-6D3546D11E1A--


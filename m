Return-Path: <linuxppc-dev+bounces-13469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FFAC1731F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 23:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx4pW6N1Pz303y;
	Wed, 29 Oct 2025 09:30:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761690659;
	cv=none; b=XVmCrGENTheyxuNUPZsNgzhy20BSxBXOM9yJcWpEYoHVVmtxS+X+AIUovUXnlySftwL8AewqbcQKg2f/mcVr+UshIBNNQbNnQoMeGcicav6JsH+OlD2zSC78Jadp9qjlXdIy4uRB5IMf4CuA6bFE56uTV+agtyOvhJMhO+H+rIUgPeHjyN0qTmuWheLhZeNDlZk5Ml/4qJtWuywHzxLdxBiFjWaPg3DMUPYSL3AYBJBIkaPLIoh1sImME1mJqKv7rNGsAE2Qh0gFrEoBHKR9W9rLegx5xhuBjVehJ/uZ1ZH4NPpjTPNZi2+Lgjss7cD1hw562KAXRnWs4gLkBVKGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761690659; c=relaxed/relaxed;
	bh=w7MYXT8RdCoSxz7Hgl9+a32CaifYT+zfGLvjG0fFD9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXSQ45USYkBqgaNnh2XKVM3A2OzwQGuqiDHXtr8ZUe/RH8iBt17HjeA4wveA1n+AhTCY/ankMS7Sbduj8+avaCiM7zGMHRk9Zku47KIZpsmclnVwZUEJOosqZqcy0AXBUneL1b1dP2s78L//ISYmgPi9EObrs73fmHnTHl0SHKZVAej7XdXVPScKOurr1xBDsIiZbAiUPklhBDpds3NIrYWJ+8p6eJ/VnYjDuaf/klqBWlAuh/v4N51rsOD/aIzbUYlaJKV7n2PHa+ctHKB1a58199YupgbhHyDiNZItb2OkTeCqvbgKBNBkBxc+rYM29lqDFQhwwwc801JxhKqAaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VNrXFQAR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VNrXFQAR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx4pV2yfQz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 09:30:57 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-471191ac79dso68786455e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761690653; x=1762295453; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7MYXT8RdCoSxz7Hgl9+a32CaifYT+zfGLvjG0fFD9Q=;
        b=VNrXFQARkiUPKpi0lqQJUaAJ2dXPro2zfxYz8AWUNPm/LhI1PpUGGq7D5ueE7ODk3V
         0kW6yP/vfVyGeYDnNA77xkUZ7lwcZCTRvaWmvuivktkYlqB9RXufPQqxA1xK2ESzHxNU
         bvhvyNse8o8ijsRwEfI6ZeMlDs16Wery2S7pN/0POC/V+D9T7ROlzUUUoLRbiMg0YoIB
         Ct9o7nf7rrh7L1oqgoyLYzrvrBKx9KkbR966bVqu86VeQPn+GSTIKSwb5Tly11v6ZZox
         oCmHidTzRYW3W1sZjRpcI/JshakLS9cxJuC9ggj5p4IoWAaDF6eTks0yh4hAbqSlGGp6
         pArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761690653; x=1762295453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7MYXT8RdCoSxz7Hgl9+a32CaifYT+zfGLvjG0fFD9Q=;
        b=h4frU5t5ThtHLwlJSuUZjBG50UW8uQ64WinWRAbjn5wJxX33DloXHsXHX2IkixJBlv
         AFLH+enLtakP3sT2NwSewrB3MFw8+niYUZ4y2K0/Zgn0AAkhL2gIv4iSYGc6m9Ggu0Sz
         cGFAM6swvTacwDne7ZXw0Dr8g2HZysTQ/jrvOvSIgox31rWfx9nYN4wKrlt/8hRuF16i
         i9QXrPi8mx2j0BB2rNOkvVtExKHMpULkeUO6kUysfEG1BUjJA0+7UxnH9uGe4aFXc4x5
         YU2BW3Oxw9gcpKbaIDeyCirnuY87+/XIRqFB8WMNODVqF5Bu9O+NFHjPNvnrgZyAgpMI
         NP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg7ojm0AYqGijZIcbsW9++iGUp/OYvtvsYN/apiVrh+erKU8TzBkEiDeL4iU0ONvTVkL3REEqkTdDS5tA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvwTjWZpROF68507Yq8K3He+fVlc/sm3tkWJXxBqdHtf1/U9RH
	1+H83MOfPj5E1vTRnKBELIAV/i10w9Wa3zAItJgW4NlzEC1cJtVJGQvB
X-Gm-Gg: ASbGncvnCVTItszJTVi/hURn98GtXElEh8r6AqwNzIK4eQKBehinHgtK+pfjjXFwEKm
	6fciVo1ey5Wo+fuZ0OVyh/SKAWdyftngHoEW5ynPSP+/v9pqAfH/0aXY4O9X9a2OKMX7DI5C4qa
	KAsXeNfPHyPYbZmPcf6nRMBVOdw+9Cj4WIT1cUPTovvaBCYvDW0Sgk1dCvHf5xjEIZnJ7vn8oOp
	NkDRNm3AY9SkA/zR4ee7INVBAyrVqbzHgscJV9Ckn/y/+lBwpClbWfJPBcW2ZJUj4l6rvao/nFg
	xr5N2lroFqFwXWOo4LKiqWp5zIaDX0WwC7DwFUE9/MnRCd5B9UbU1lZ23RAadIU/Hux5iKtGNBx
	7F9lXu8f91wA/lA6rVpe08aIP4wgDI1xK2p/zFhsHzTj7ZdCVASg8B619cAL/QdURMNKF4g6JRb
	1pgVlFtLKQU/Xbi0a8WF47i0EBpEZpHMmgrLT+oJDkhgVRNE0b++Bj
X-Google-Smtp-Source: AGHT+IGr3MaQmjLDcnechwHoyti0ltwYCF5fdXDSzbiJBdxMc2AUsas+y5bOu1/39BNyQHtZcenqXg==
X-Received: by 2002:a05:600c:474f:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-4771e1ed170mr10187095e9.28.1761690652951;
        Tue, 28 Oct 2025 15:30:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm16032815e9.15.2025.10.28.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:30:52 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:30:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com,
 christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
 edumazet@google.com, hpa@zytor.com, kuni1840@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mingo@redhat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, tglx@linutronix.de,
 torvalds@linux-foundation.org, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251028223050.3e3ce110@pumpkin>
In-Reply-To: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
	<20251028053330.2391078-1-kuniyu@google.com>
	<20251028095407.2bb53f85@pumpkin>
	<CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 28 Oct 2025 09:42:25 -0700
Kuniyuki Iwashima <kuniyu@google.com> wrote:

> On Tue, Oct 28, 2025 at 2:54=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 28 Oct 2025 05:32:13 +0000
> > Kuniyuki Iwashima <kuniyu@google.com> wrote:
> >
> > .... =20
> > > I rebased on 19ab0a22efbd and tested 4 versions on
> > > AMD EPYC 7B12 machine: =20
> >
> > That is zen5 which I believe has much faster clac/stac than anything el=
se.
> > (It might also have a faster lfence - not sure.) =20
>=20
> This is the Zen 2 platform, so probably the stac/clac cost will be
> more expensive than you expect on Zen 5.

I must has looked the cpu type incorrectly.
AMD haven't made it easy working out the cpu architecture.
I need to get an older zen cpu for my set of test systems
(and some newer Intel ones).

> > Getting a 3% change for that diff also seems unlikely.
> > Even if you halved the execution time of that code the system would have
> > to be spending 6% of the time in that loop.
> > Even your original post only shows 1% in ep_try_send_events().

I realised after that you might be showing a 3% change in that 1%.
>=20
> We saw a similar improvement on the same platform by
> 1fb0e471611d ("net: remove one stac/clac pair from
> move_addr_to_user()").

Certainly removing one could easily be measurable.

	David




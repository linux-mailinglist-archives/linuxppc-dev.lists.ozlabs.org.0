Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9493781C82D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 11:33:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NtemF4Xx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxNtP29tNz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 21:33:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NtemF4Xx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxNsY3mnFz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 21:32:31 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d422c9f894so2232085ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 02:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703241149; x=1703845949; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4giY87NampDkKxolYu5WR6Es2kMV091Z+lpYToWl+c=;
        b=NtemF4XxyKbe8pSY5FX9L5zE89rr+D44fmXUPYN6QVR5cGya8ApmsGExDC2KDS9bxR
         MVhHGvYYoQlAAd0hRlV32X8TPHtq/w46TFCf6OcgnxuAcJCvMzyP8rZaAjB17NaSrE5F
         NU9TcYL7eOUoU9WqKP89cWKLOHmCRI8cnAj6/DKTWg1DlYYcLqmDq7+9pUqI7ooulmBv
         dYGBqmUYU0GmV7a+MR8e4r7mwsOZRHUP2pJgyFPLUScGpnVHVYqJE32mXKDDf9voqyUA
         oGgBCuiaWYYWRNPjoiaXLCZVryLhPX2XpIvO3XKinDu+l4lmexiRYghO39GMknNHbB+W
         OEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703241149; x=1703845949;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4giY87NampDkKxolYu5WR6Es2kMV091Z+lpYToWl+c=;
        b=PD1VGZaG+s5j/0DshVmWe9BzhR27N3cWQY/zpAAGhI0O6jMjV983bH9WR7HpekU/Km
         EkAfT8RZnpS8IZX9lmHmWJb8q6l1qE3gaVswq60GtPXhcPXgdrHp+B6jOz9YJfgv7qaC
         /g1cxKNbzi8Uks0gGo47KGHKshR6RLCF4FT/PfthyU/gN7/3CfigmUFNloUYGVSIuitw
         P18b69ILCNXoJBQpjjMRNKv+S9/Yn5ahoxhhvMX+agEFU2wvYFXJlcvd/Pp7P4CX2JiU
         UnLu9v/xze0ijke70CMo7votEoQGuZnR60NO25Pe9zAU9LYuQI8CFUM0UNPI18CUshri
         Cavw==
X-Gm-Message-State: AOJu0Yx2RRH1v0dFFfDfdpzYenLDarM3fHLlPZ16uhQfDzeQzeIKE4kw
	sxxHNPQFlWIDL8rNE3xIn9s=
X-Google-Smtp-Source: AGHT+IG8gauL9m6tvCBin+loqKrUACbeqn9zdF0tDnVTHbZLb1FZCFS/jgN4fKubeLgzSx/LljX2xA==
X-Received: by 2002:a17:903:2311:b0:1d3:a2b6:82aa with SMTP id d17-20020a170903231100b001d3a2b682aamr1317329plh.120.1703241149197;
        Fri, 22 Dec 2023 02:32:29 -0800 (PST)
Received: from localhost ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id bh10-20020a170902a98a00b001d4160c4f97sm1346880plb.188.2023.12.22.02.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 02:32:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 20:32:23 +1000
Message-Id: <CXUSLF9OFLV3.3UD92Q4VTWN9G@wheely>
Subject: Re: [kvm-unit-tests PATCH v5 07/29] powerpc: Add a migration stress
 tester
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-8-npiggin@gmail.com>
 <7cfe96f8-b483-476c-8d15-746fcdfb23a6@redhat.com>
In-Reply-To: <7cfe96f8-b483-476c-8d15-746fcdfb23a6@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Dec 19, 2023 at 3:58 PM AEST, Thomas Huth wrote:
> On 16/12/2023 14.42, Nicholas Piggin wrote:
> > This performs 1000 migrations a tight loop to flush out simple issues
> > in the multiple-migration code.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   powerpc/Makefile.common |  1 +
> >   powerpc/migrate.c       | 64 ++++++++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 65 insertions(+)
> >   create mode 100644 powerpc/migrate.c
>
> You should likely add an entry to powerpc/unittests.cfg ...
> also, wouldn't it be better to extend the sprs.elf test for this, so that=
 it=20
> e.g. changes some stuff for each migration?

It was supposed to be kind of a dumb stress tester for the harness
that just runs as quickly as possible for a long time :) I'll see if
it can be massaged into something more useful.

sprs (and others) probably should get better migration stressing
when multi-migration support lands in the harness, but I was
thinking that could be follow up patches.

Thanks,
Nick

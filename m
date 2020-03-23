Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD218EFCA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:29:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m4HG3ZL4zDqf4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:29:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DScEpP3G; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m4Dw2Y4HzDqg6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:27:43 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 23so7046768pfj.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 23:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=+Fl9fJ1M/BX+yC4WksQ4C/AuPe+VLsYJgRRv9jQTuJI=;
 b=DScEpP3GXwZPNq/0B9jxSKR220Wa6RkeOPpPUDYWDqcM4P08FRfdIV6pVUBLlLtmz/
 A8pJorZhEW5dkBrYqUfdG1G/wlZ7tAyoupKO/cJe/PUNGpY3gMgz25HL6gLm9HE01Me1
 6dLaabxwmJN7AAEGpGbdO/+HsBG/3YjrGCalgPqSlTT7kS5T098b3etOH5EzDm/9DTcl
 4dbm9lY8rN215haHrQ5j+KBnhiqnHNTBNV2+P0jIYdFqIXkE+VD0SE2fWdbxkeL6wrq+
 FU0299G8LyLB9okA/R7FvSANkuJO2Dn1hXQ6x+BCzchuErQGsO97rzGP5Xl7PN2e/iGU
 Ageg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=+Fl9fJ1M/BX+yC4WksQ4C/AuPe+VLsYJgRRv9jQTuJI=;
 b=irYvBRybeNjg9uWnsVFxCu5Nn+j7js7MQEuUbtFpCLv/s9d4PLXgU6hz1YmVeLUtxP
 S86Yv6nKvpJvqRny3VoOMwnnn/SrAOh2Bd0eTgWuC3mW3SOonhVqdSEcBJWV+R1e4BL3
 2y9MViD1kKkGuXD8ZMhexq/NxAc9InsLDWcV5SfX/zP6SWP1PJcgibygXoKMKXT6L44z
 EVY40E+Kr8MY2mysEJfOc0A6TzBP+5pmv1+2zHU9FxAcSjdKyhj/hjKsU5DgnJJnCioT
 bJyOmaRkoUOOLwTfKAZAGGlPyHNXvlo7HOxXJd1UaM1+4/oJNMsQGMz+mZDwr5Cop44h
 C2CA==
X-Gm-Message-State: ANhLgQ1M2ggl2AFQD4KejpS7glVHTY3fjrJ25ldwSHG+Gah6KRSkp0uS
 sHdURlGPjVhyABPYkOTosYI=
X-Google-Smtp-Source: ADFU+vs/Ia0XbEzV50NPY0iF3RZWHlMOKw4qIZToY6KHQ7i+ZD5F2eZ/PWZuPbwK2PNpP7b8wgwI8g==
X-Received: by 2002:a63:5c1c:: with SMTP id q28mr3865910pgb.125.1584944861262; 
 Sun, 22 Mar 2020 23:27:41 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id e126sm12188845pfa.122.2020.03.22.23.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 23:27:40 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:23:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 03/16] powerpc: Use a datatype for instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-4-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-4-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584944554.pe2tzckmyl.astroid@bobo.none>
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
> Currently unsigned ints are used to represent instructions on powerpc.
> This has worked well as instructions have always been 4 byte words.
> However, a future ISA version will introduce some changes to
> instructions that mean this scheme will no longer work as well. This
> change is Prefixed Instructions. A prefixed instruction is made up of a
> word prefix followed by a word suffix to make an 8 byte double word
> instruction. No matter the endianess of the system the prefix always
> comes first. Prefixed instructions are only planned for powerpc64.
>=20
> Introduce a ppc_inst type to represent both prefixed and word
> instructions on powerpc64 while keeping it possible to exclusively have
> word instructions on powerpc32, A latter patch will expand the type to
> include prefixed instructions but for now just typedef it to a u32.
>=20
> Later patches will introduce helper functions and macros for
> manipulating the instructions so that powerpc64 and powerpc32 might
> maintain separate type definitions.

ppc_inst_t I would slightly prefer for a typedef like this.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
=

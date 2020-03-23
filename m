Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57718EFC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:23:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m4836nMlzDqtR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cAY0BkIV; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m46M443zzDqlL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:22:03 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id l184so7016668pfl.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 23:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=q+KOKZn12AV03xUxmOLFE1neToEAvzby7VXAuVoAqLw=;
 b=cAY0BkIVbIx3SCAywHcAw+vU583p1Vre8LgTnc4Dz7Z33OojSwc2dhKQCUCQ+tQxCS
 /NxSOy5MV9a3JwJXdbSuj9AyxpPyu9pRDBlx70V+M8LGkC07Bl6MNP9PRNBINxefq+TQ
 2MLZtI+DIW5Q1egv8Rj1jQGM7tYs070zVhsxhbLOfiHQj2V5YQ1LDyQJRnnnbCr6ympU
 amd1DwGc13S2D9OeoGG5LoSWjlYxoHydmHhxemUwh4Xr18elIA0KKwR5fLWZFCNh/350
 TKqVqlXHFs0RSdkVA8qvltciOL3qq81/prS8AzUmx+S4rtBzflwd8GY7H/RL3fEXScES
 0IAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=q+KOKZn12AV03xUxmOLFE1neToEAvzby7VXAuVoAqLw=;
 b=UvhcAih0+G7WTIpw03SGhgZ+ffwBo9S+ziLUZlAneSUEFUn9jhRe65urITYUXnljdX
 NEN4BNvi47chkrVKfL+fTjrzOBUctM5PUzF2sz+1XJkkz4POlIePZIMbTkUYc8NulGTQ
 xt2CxMOZ2IQgh6eMfiUEK+17YMh7RgPKKmBqKz9W97YftWEpqGARMTHCkP8zoEHSolM/
 jEffgpRGAfNt/+uKZP78ungMXjC2peWG3gdfZPi691pSQe5rhzNh46A2kK6/B5VwKjKt
 50glv12C+UL6ypftkugYs0N3MlFnxYRZHTIuQTj5rhCYxG3yBrPQTR1DiXUJFjBg2z7P
 w+Cw==
X-Gm-Message-State: ANhLgQ2SnTmvg9BPkVxGXsj8jJz7Xl4vWdGTuproNiGUnRjPQADhJxLy
 V5wK/+HO9PtzQxwxN+3mqYU=
X-Google-Smtp-Source: ADFU+vuE/N/NaciC9uAD9vQGpfCakQaC/aN57rSbQUZ+h4rX/T96TFu3CX6mfqGLNEKh1uWx0g35AQ==
X-Received: by 2002:a63:e856:: with SMTP id a22mr7121840pgk.283.1584944520114; 
 Sun, 22 Mar 2020 23:22:00 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id nh4sm11101912pjb.39.2020.03.22.23.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 23:21:59 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:18:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 00/16] Initial Prefixed Instruction support
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584944279.gvl0lg5dde.astroid@bobo.none>
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
> A future revision of the ISA will introduce prefixed instructions. A
> prefixed instruction is composed of a 4-byte prefix followed by a
> 4-byte suffix.
>=20
> All prefixes have the major opcode 1. A prefix will never be a valid
> word instruction. A suffix may be an existing word instruction or a
> new instruction.
>=20
> This series enables prefixed instructions and extends the instruction
> emulation to support them. Then the places where prefixed instructions
> might need to be emulated are updated.
>=20
> The series is based on top of:
> https://patchwork.ozlabs.org/patch/1232619/ as this will effect
> kprobes.
>=20
> v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel Ax=
tens.
> The major changes:
>     - Move xmon breakpoints from data section to text section
>     - Introduce a data type for instructions on powerpc

Thanks for doing this, looks like a lot of work, I hope it works out :)

Thanks,
Nick
=

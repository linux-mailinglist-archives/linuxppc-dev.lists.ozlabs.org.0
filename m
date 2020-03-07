Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 342ED17C994
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 01:18:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z4nt57k1zDr5b
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 11:18:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.196;
 helo=mail-pg1-f196.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FXWjLbjm; dkim-atps=neutral
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z4mP1WQyzDqxc;
 Sat,  7 Mar 2020 11:16:52 +1100 (AEDT)
Received: by mail-pg1-f196.google.com with SMTP id s2so1816901pgv.6;
 Fri, 06 Mar 2020 16:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=K8pc6nK10T7kKC/Tsxb3DhGd12iD01FPBP08JTiFNdw=;
 b=FXWjLbjmUVpiOVBONU5GmiksUc5Wc95V51YrG0Rwbjjecc3BsIrtIDvGJkK61tkvuf
 Nadera+8s5HfCfKN8iK16IuWANwcAAAB2cCk1idW3SKNFM7F1hKhMfhgN8Bq14w274wn
 3M6SZ63lKM3IjH9WyS4RuCbt0Ze82P/WxCoWKnlzavO3LQ+aZAOtJgVRXSa+z6Ny0Vjg
 yMNu9Wutr834VFdBmuqODRya4bG1BoKhe6UcuI0m8E4ubJamSPvGCUS3uHp4GeZCSx0Z
 /hC9/q3U0uWvMgkTbxgvG5jQp2RhqS5fFGx9ieMT9v89xkdPVj6Z2pBNtUZYf43+8TR+
 vauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=K8pc6nK10T7kKC/Tsxb3DhGd12iD01FPBP08JTiFNdw=;
 b=GVbA+ky3esjR9jW7Nz+4l4pq27H41CfVC5MuQGn0YZpGhZp0O1gjoiVyoTA0XBv/nU
 vEnPUshMTzFzJm9cOAiS/6BjdnBQKeNUvMReja93Hvflwgvm2RnJ2Q1B7657isesvUMQ
 7obYmOfVlWTzP56OqRoeBwXqPIfuzM3ddC1MrgKqRkJzZBooQaAot3EBj/9YigVwX1Ga
 EUBRyncveDICc8xoOrMz1vumIDfeouirE4iY2N+FJJbBQvTYV7OMCEruv2k12EgjW5gl
 nroauw3Fce1m9y2ue2ZNiZosxtRJZPSd4VG2KtoN4LmU/xBbO6VuMzKhgbm/6iHOWcK9
 WEQA==
X-Gm-Message-State: ANhLgQ3MGVY9vLx/P9Jh2GYnxZZG63vvLvhXT1qxyaL3w28EvG10eNT1
 RnyqgqPrCAkTGlmbBkXejmtCNmo/DvU=
X-Google-Smtp-Source: ADFU+vuBJQkXsXSocuhXdNhesUC+DwB8vB8H9UA9qY+se0T2nuhABhAXwmaFU591gDkJxCr5Wye+xA==
X-Received: by 2002:aa7:858e:: with SMTP id w14mr6406479pfn.151.1583540145419; 
 Fri, 06 Mar 2020 16:15:45 -0800 (PST)
Received: from localhost (193-116-204-226.tpgi.com.au. [193.116.204.226])
 by smtp.gmail.com with ESMTPSA id m18sm34819034pgd.39.2020.03.06.16.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 16:15:44 -0800 (PST)
Date: Sat, 07 Mar 2020 10:15:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] Add OPAL_GET_SYMBOL / OPAL_LOOKUP_SYMBOL
To: Oliver O'Halloran <oohall@gmail.com>
References: <20200228030751.271382-1-npiggin@gmail.com>
 <CAOSf1CFLYhwp42TYc1AGinJOfbSBrnZJLOwRUAy=7Vfj1jBO2A@mail.gmail.com>
In-Reply-To: <CAOSf1CFLYhwp42TYc1AGinJOfbSBrnZJLOwRUAy=7Vfj1jBO2A@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1583540041.urzgqyavs2.astroid@bobo.none>
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
Cc: skiboot list <skiboot@lists.ozlabs.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oliver O'Halloran's on March 6, 2020 12:42 pm:
> On Fri, Feb 28, 2020 at 2:09 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> These calls can be used by Linux to annotate BUG addresses with symbols,
>> look up symbol addresses in xmon, etc.
>>
>> This is preferable over having Linux parse the OPAL symbol map itself,
>> because OPAL's parsing code already exists for its own symbol printing,
>> and it can support other code regions than the skiboot symbols, e.g.,
>> the wake-up code in the HOMER (where CPUs have been seen to get stuck).
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  core/opal.c                             |  2 +
>>  core/utils.c                            | 92 +++++++++++++++++++++++--
>>  doc/opal-api/opal-get-symbol-181.rst    | 42 +++++++++++
>>  doc/opal-api/opal-lookup-symbol-182.rst | 35 ++++++++++
>>  include/opal-api.h                      |  4 +-
>>  5 files changed, 168 insertions(+), 7 deletions(-)
>>  create mode 100644 doc/opal-api/opal-get-symbol-181.rst
>>  create mode 100644 doc/opal-api/opal-lookup-symbol-182.rst
>>
>> diff --git a/core/opal.c b/core/opal.c
>> index d6ff6027b..d9fc4fe05 100644
>> --- a/core/opal.c
>> +++ b/core/opal.c
>> @@ -142,6 +142,8 @@ int64_t opal_entry_check(struct stack_frame *eframe)
>>                 case OPAL_CEC_REBOOT:
>>                 case OPAL_CEC_REBOOT2:
>>                 case OPAL_SIGNAL_SYSTEM_RESET:
>> +               case OPAL_GET_SYMBOL:
>> +               case OPAL_LOOKUP_SYMBOL:
>=20
> These names are still awful :|

Ah yeah sorry I said I'd change them didn't I? Anyway don't merge before
the kernel is on board with the idea.

Thanks,
Nick
=

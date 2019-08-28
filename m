Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F48A0128
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 13:59:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JPRV4WrjzDr8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 21:59:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="El3u9MP9"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JPPg0ndPzDr7m
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 21:57:42 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id p3so1341757pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 04:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=6Z0PYX4Cyn3loSxBT18GyPUmeXrOJsbeBH+CebVQ+IU=;
 b=El3u9MP9frjfoSu+zPdt6SqI4iO5Y334Rg7zY2atQMmjQ4vl0BIXsBwgMwC6svSUDb
 s7y8thEO9c2UjfXJb8Y2s8IgH7Sbu1iiDByV0ioI8hp86iPu5tDMZ8cyktBelp9ToBCD
 ImHHfHKv97mvQ+cr7ko41eXPfco5lV3Sv8gfDyuhD+8NEDJbYbB8djo/rnOuaykd9/K2
 Kg8mewXI2yM7OOxlpGsDqc1mkQc7L84l1alpsuTJqe/aPf9zcFCECsCP1G4cTE4OTUQ6
 FZIDattXKrSfkl31gGHnSBSM2nxyvb0/acHtgVWSlZS9GGS6MzG7S1NE89WO238dR7Ps
 Q/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=6Z0PYX4Cyn3loSxBT18GyPUmeXrOJsbeBH+CebVQ+IU=;
 b=bWxyIzM2pO0wD6uum0w8Z8CDZhWRjmD5m8yjtCPRWiFUjPwWsEsHttAPvSsqkOLPWU
 Tonrs1efJM6AZRu+itGmfVZcgJCnQSgQLy4Z3f82QeCy4dpsU2nVACPeD8HdHuua4m9F
 C0pdpV1//Ecorim2Y+r7QTFlz39ugPUAyyJle1hXDbxzrE+X2RkgKgkNzIDqJkzfmGkz
 YcHcYDQXCvPDBCfhVs+MzYHtN0KAvPag420NURmAr+9sqC7DEVJlSq9khTFuUrfGb/M/
 cQHy7kw2w4Y4CQxWvZOwcIPWeUrKT3RIbB5uQHyybwLzBTRJ01Vu9XZoGyx9hvL7uGOi
 B88g==
X-Gm-Message-State: APjAAAVTtFPWR515f/+EyNzp98wXlaFdu8asIM84c6gWiYQZdL193w+n
 HuuFbNwRdL/doQJIw2JtIrI=
X-Google-Smtp-Source: APXvYqw7vsfsxCmiIy/ApCXiiWqjZt/9mL3p8Ba12+dLUHbWaNexoGE5bsW6lvi460la8JnnN4ZWqw==
X-Received: by 2002:a63:7e17:: with SMTP id z23mr3170037pgc.14.1566993459651; 
 Wed, 28 Aug 2019 04:57:39 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id b6sm3331361pgq.26.2019.08.28.04.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 04:57:39 -0700 (PDT)
Date: Wed, 28 Aug 2019 21:56:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: interrupt return in C
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190828090606.5028-1-npiggin@gmail.com>
 <33052597-ce23-780d-bb38-f50ecd78ff3a@c-s.fr>
In-Reply-To: <33052597-ce23-780d-bb38-f50ecd78ff3a@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566993326.4dy67dpuzt.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on August 28, 2019 7:28 pm:
>=20
>=20
> Le 28/08/2019 =C3=A0 11:06, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This is a work in progress that goes on top of the syscalls in C patch.
>> It's not quite complete, 64e low level exit is not taken care of, and
>> the new return is hacked into the existing interrupt handlers pretty
>> quickly (e.g., full gprs handling is still ugly and could be cleaned),
>> but that code touches exception-64s.S which is under heavy modification
>> in parallel so I will rebase on top of that before polishing it properly=
.
>> I will also try to convert to more IS_ENABLED() for Christophe.
>=20
> I am flattered.
>=20
> I guess at the end you are not doing it for me but because it is on=20
> purpose in your code improvement process.

Heh :) Yeah I agree it's almost always nicer code. Sometimes I just
forget about it so I appreciate you pointing out improvements.

Thanks,
Nick

=

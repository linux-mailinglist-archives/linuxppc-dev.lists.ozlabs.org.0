Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 387313AEFE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 08:31:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Mjw728xwzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 16:31:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="phKC3gJ9"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MjtM2VgJzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 16:30:18 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id t7so608321plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 23:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=jVE3WZ2oQR5fve+ihhbz3sgFdDelhlSSTFLSzl2wxmc=;
 b=phKC3gJ9VpHbIwpxeGV1PM24n5+RhgRMlVSgFdP1lIHuEgzf0VoElG77nM2Y4VNjTG
 QJyhdNOx3hjuk2N4fxdkM7+e6+tWoZWCkZ35wapfK6p6Eo6VdUNQtvyEbEjSMhJLJj32
 k+yF4D6MYeSX6136mazd2cchqom8jqD0QSJtQaO5JDCxDjAZNk5tNdxpNBq6wtSWKJQy
 QXYPJNlPRWquxM0AXrLQUPxhqEq5UDsGn6LPMpi4Zr1yggDyn/1vBm/Qmmx6DGzNSShx
 nIVBUfJ1YGwwMiCxel4cWr25jTAvW6PH3XydSnGXeOaygpEHVqLAqBf22omWaDhddRbT
 hVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=jVE3WZ2oQR5fve+ihhbz3sgFdDelhlSSTFLSzl2wxmc=;
 b=fbwHzRutjpyAAZDMShAK3/Xwov+pmfaiVqcBQ2NFcqhQ9gGUBmsgQlTeTIwWEQSgZ7
 sGRcUuo5kLOokPBOxP+UAYm38NtCVI6UwmABO1Uv6VY1QDFtt5VrDz5V2vmOcgDdds4J
 BRmZkKrkGyKZD0ZryWX+0IUtBuh78C+Nzr+9UsYF+GVR6JsjEQc9yAOObijlrHJYu9aH
 tgVZgMxf7b5BeP2CYvvtAZKEsA5xgA4LR5wHdM5hngjP34kYr+iG08r8e2apQuHdQ/2p
 JW92Jf9xNLje2FvqQYO5elulu3gtq96Iurokewc+YGz/xcbgl502QGOWun5I31W6BMMc
 L2Vg==
X-Gm-Message-State: APjAAAWQ+YpImBu961qW8TYoQtiBO3+RCoMoRGknNWVCYsPRUHVcCtrn
 pfPuHtea/kNZ3pJJARkHF5Q=
X-Google-Smtp-Source: APXvYqyVKnOp0YH+RLM03lDoU2MFlXdvwjwJT0UZQwyw44zKBJXIBGfMFbTejJEAs/ZuAk5SrktjUQ==
X-Received: by 2002:a17:902:8ec7:: with SMTP id
 x7mr27324583plo.50.1560148215307; 
 Sun, 09 Jun 2019 23:30:15 -0700 (PDT)
Received: from localhost (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id d10sm13334764pgh.43.2019.06.09.23.30.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 23:30:14 -0700 (PDT)
Date: Mon, 10 Jun 2019 16:27:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [Bug 203837] Booting kernel under KVM immediately freezes host
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <bug-203837-206035@https.bugzilla.kernel.org/>
 <bug-203837-206035-1lnk8ZObWZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203837-206035-1lnk8ZObWZ@https.bugzilla.kernel.org/>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560147822.prx4jq4u2h.astroid@bobo.none>
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

bugzilla-daemon@bugzilla.kernel.org's on June 7, 2019 4:29 pm:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D203837
>=20
> --- Comment #2 from Paul Mackerras (paulus@ozlabs.org) ---
> Just tried 5.1.7 in the host and got the guest locking up during boot. In=
 xmon
> I see one cpu in pmdp_invalidate and another in handle_mm_fault. It seems=
 very
> possible this is the bug that Nick Piggin's recent patch series fixes
> ("powerpc/64s: Fix THP PMD collapse serialisation"):
>=20
> http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D112348

It's worth a try, although the bug was introduced around 4.20 and
I wasn't able to trigger it on radix, but other timing changes
could cause it to trigger I suppose.

pdbg (https://github.com/open-power/pdbg) is a useful tool for your
BMC that can often get the CPU registers out even for bad crashes,
this might help to narrow down the problem without bisecting.

Thanks,
Nick

=

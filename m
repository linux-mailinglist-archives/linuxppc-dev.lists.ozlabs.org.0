Return-Path: <linuxppc-dev+bounces-17477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHT+ACSbpGnZmAUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Mar 2026 21:01:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 801371D16FB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Mar 2026 21:01:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPCcv54Mkz30MY;
	Mon, 02 Mar 2026 07:01:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772395295;
	cv=none; b=LDQXmbXJgQTrKCnZtE7Aj9VRF75ZBK++656J3ABaL78vdDxA73PVrIO/N/bd76C+WCGl6KkCXtgicjOpnbn+iS8QRBV2otEtTnAqsQsHEfJbPKu+11ys0/XnH61v620j1DbA18xSpw92p4YSiIZ89MMgt0C+Abqdt6ZByqI3N/31EJ8c/ccdbftPlBAraB/d0NMLb5CUbhCiOlT7sK5j0t42yJJTwoCY+eWzilYn9hdeOZ+tyGfo0RRGJKa8Us/G08vp7l5WvhpkMP4DQyOPMJBZ2E4aDr6IIcpMlhpBCCTK/Iynzzm+sZgzqhB4m95DYAa2h6WaG3tfboGBxy9fag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772395295; c=relaxed/relaxed;
	bh=9jB/XXPWSS4Vb7E8KI5vsQ0OyjX/VbHAJPkU3Kvm8KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkQuLUqocatWi2TULeUfSFSScuE55RqUzXi2km1dS+HSPcoiRoweLVKi3rMpTkNfZkPFMZUk6lVY3fuZt1w0r24tXLUVoERqTm2mgXIemJm4yJYzYIBdMjLiIva69+t/8Af95FwGuzrIwgpBR1Gqid9Zyzhi3iwtpH7CDoJ/epgEvAAfjcKl36CLU1Kd7p0x3ibms1wjEQ0RxGmLL8HBDaj2hEcl0OApxre4eam8i85FbHyXSw73bofzSYoOw3mmod/c51O7KsWjtVPRSjp98Em51zShged/U3k6NgLI1LKK7BGpNe5+e3t4k1QuNE32s8nBGhPv+ZJzqXd+gc22Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PfYFzJvT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PfYFzJvT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPCcs6H2Dz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 07:01:33 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so446427466b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 12:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772395289; x=1773000089; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jB/XXPWSS4Vb7E8KI5vsQ0OyjX/VbHAJPkU3Kvm8KQ=;
        b=PfYFzJvT0EkQ58JgDjAfzIyvtXlswo/GSEm9Jo/bFQYvDx/HLxNMAsaXeDjdL5c/93
         HwnfUsvRpyWo1aMmTlcdVx3E4OTn58JZHdsZH8uh3+N1ribCzOSAW/Qz5fUC02vD82NB
         N4o9V9yVK6iqZotGhwh2+fdNHZy/pYQ/EsR0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772395289; x=1773000089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jB/XXPWSS4Vb7E8KI5vsQ0OyjX/VbHAJPkU3Kvm8KQ=;
        b=jXtPAWMPQJ4UzLe3/l1SkrXTF3M/HF8jjN/WcK56wsFuPWWtvLWtKgY2gn4H0vPBGk
         sfkOCqZllO3T9spw5S8Sr9n3kla6u/36zJBU6Y2Fy9c63id+CoVIDbD38BXZ4Trk8WEk
         vYXs+zEishh2Nl5a/pX8KtSVEKYPBOc+7qY5QSmHmV/wRY6zpbk4LGHQ0RVOWkH7tGrQ
         QC3KeXM5lL+BEgwbcYVCVx0OrhhvoQp+ZRgDEJoNX/oJUZveCMUpP9XSAKJnQXxzUO/4
         MI8iXDeybAHp5c5JYsxFuizr45wu4f+sCd0c6bDMpxe1A1kBzD+A7c5hV3fROt6Ewniq
         s/5w==
X-Forwarded-Encrypted: i=1; AJvYcCV6HteewJJMTUU5gUMnf2doHhjHYw4Oro7ozln56nPjNwUshBQupcf0dJrDXrX2aEPS9LJQqBx5SFMGapg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwC9cmqBWoz8kreNFuWnvxP/YdjlEEOalUkNBAdXEDtmAmO6vgD
	z4zjYONN5V/kwQJ6eESqtMiiurvUzVdPd2PX2HEauHbj7vlIOkpv0tLgZICCJ1KII9ohUJxt1UJ
	j9+04gp3wVw==
X-Gm-Gg: ATEYQzzKLi/F1n0ysF522525m9xoq6yA1LwE3kSRyT6FNxzW4r3yevxA2Gc4/f49Ior
	GsJq+oF20z6iO9LVNmW27FWP2O74vTRTup70MKEwBVNXEg5XtlMQZ4H6BVmGX6esECdoHSv1jWO
	v2APnEqRi9uwgXiN1gJ++eM6JgTSXm6EVuCcx377WIzUvVHzcqYzn3JzCCdh1ujFae+QlOENDK7
	0uWxu0Xw5yj4IukRMEv9/SYoe87IkkBlVd+v2uj4NKGYM54da5dF8O4ASBn6U6qpTLpfDs2qMGb
	q9O8WcmE8IxLZnI61/jhttPbDYY/68nCyy9a/qFzt7Gp+oqeEDGH1n0lH5qJXVfATnOInPb9Cox
	zDXP3Ym4tXAJ4bAoE/G3WMWkzUcCHKM+ThJO1gkCZCFrxyRDP0VZD3Zb06lh0o46OLtC1hDnkpw
	jl65fhSWpMwnobVg/VBwgGD53Uahs5AqlTWLxJ4AvXhDKhmkMKmjfvn9SaETdCgf4arpaBQLru
X-Received: by 2002:a17:907:3f1d:b0:b93:5405:9260 with SMTP id a640c23a62f3a-b937c64ef77mr572442866b.30.1772395288700;
        Sun, 01 Mar 2026 12:01:28 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3ea3sm390816566b.57.2026.03.01.12.01.26
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 12:01:28 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b939cfc1e83so108484066b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 12:01:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpF4s2zOZUove0uU4UEqDnEnjB9199M4B5p/8D4uZrTT1eOgEsSqA+k7Eex1eGS+cq1IQpvMcF7OTlEtk=@lists.ozlabs.org
X-Received: by 2002:a17:907:3f1d:b0:b93:5405:9260 with SMTP id
 a640c23a62f3a-b937c64ef77mr572433266b.30.1772395284743; Sun, 01 Mar 2026
 12:01:24 -0800 (PST)
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
References: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
In-Reply-To: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Mar 2026 12:01:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
X-Gm-Features: AaiRm51s3eNxZj_25SK_rlwxCS0TV1EUyjNISFnudmurbAezRL6om8RwkB99_8Y
Message-ID: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
Subject: Re: [PATCH] uaccess: Fix build of scoped user access with const pointer
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17477-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:tglx@linutronix.de,m:linux-kernel@vger.kernel.org,m:christophe.leroy@csgroup.eu,m:mathieu.desnoyers@efficios.com,m:andrew.cooper3@citrix.com,m:david.laight.linux@gmail.com,m:lkp@intel.com,m:linux@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:x86@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:hca@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:Julia.Lawall@inria.fr,m:nicolas.palix@imag.fr,m:peterz@infradead.org,m:dvhart@infradead.org,m:dave@stgolabs.net,m:andrealmeid@igalia.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:linux-fsdevel@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linutronix.de,vger.kernel.org,csgroup.eu,efficios.com,citrix.com,gmail.com,intel.com,armlinux.org.uk,lists.infradead.org,kernel.org,linux.ibm.com,ellerman.id.au,lists.ozlabs.org,dabbelt.com,inria.fr,imag.fr,infradead.org,stgolabs.net,igalia.com,zeniv.linux.org.uk,suse.cz];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 801371D16FB
X-Rspamd-Action: no action

On Sun, 1 Mar 2026 at 11:34, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> -       for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
> +       for (void __user *_tmpptr = (void __user *)                                     \
> +                                   __scoped_user_access_begin(mode, uptr, size, elbl); \

Why are you casting this return value? Wouldn't it be a lot better to
just make the types be the CORRECT ones?

I didn't test this, so maybe I'm missing something, but why isn't that
just doing

        for (auto _tmpptr = __scoped_user_access_begin(mode, uptr,
size, elbl);         \

instead? No cast, just a "use the right type automatically".

That macro actually does something similar just a few lines later, in
that the innermost loop uses

         for (const typeof(uptr) uptr = _tmpptr; !done; done = true)

which picks up the type automatically from the argument (and then it
uses the argument both for the type and name, which is horrendously
confusing, but that's a separate thing).

Does that simple "auto" approach break something else?

                   Linus


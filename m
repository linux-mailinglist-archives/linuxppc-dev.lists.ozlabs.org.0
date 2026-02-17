Return-Path: <linuxppc-dev+bounces-16893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBR7JJc2lGlpAgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 10:36:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C203814A747
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 10:36:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFZK02QFgz2yS4;
	Tue, 17 Feb 2026 20:36:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771320980;
	cv=none; b=GhuZ1HAhjZjRYJKVXI4Dlh+5EMg03CZFuN7FS4H0wVprjIqgpAGMT7Xe6nLFSk8r5i6+IulqYW+hVFXgvXM0ZrgHF4xm7IweVcA7UGfxI6c70v5oXEUWAw6E7fW+OVZy3zn6PIJPGEf4noOnqJMcwTIwIO84e94X22f9UDXWON/WHZ8KXz6FiGzyaIixVyK1Gpg46+Z9unT99RMWWNONIcvgUuhMYeW8S/plCcFCM+2+5NzMYbL6Bzfmo78Np1KfBBw3TVbZoJAdyrEIVzu5q+fnEcKMkIQLscqsXSkQuiGet1pI5xdgkNAlKLXP341yspvNU52sDMHnt86bPFQWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771320980; c=relaxed/relaxed;
	bh=jppHwni8U4RDg8yXe+tFiHh3KGo6bZRPsMrl1Tp+UrE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=jylOel+RwE4rseXJXOhSjbbtkwW5TJuAHcGZN2g8anbYBWC9mZtALP9lIFMeS04zEPcoo/GYc3hHzaHO2Tw0x0xPOshCtgXJmWt7he0UCKLeq6hRYHb6OcSOcA4jfWJjG68yFnZVq+WcbCZFFtku2vPCh/hQ7miSXxk9IytT8gJYLke3oj9J8tju1ved5lVyJnH4OT6jpzNUdNLeoG1opsRTZrRD7q2D5aW0oEFos+8xh0o0C8IMKCDFuvYQwUSaPbER5uIBslDxOL8WAgO1G4gjqEZgZAhb8yiq23y8uzp7yihOwsCVJkfUR3z/ruGOm1/YvtwUge+08nIemsM+kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ayKkUXIV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ayKkUXIV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFZJy3HMRz2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 20:36:17 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-823081bb15fso2254972b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 01:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771320971; x=1771925771; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jppHwni8U4RDg8yXe+tFiHh3KGo6bZRPsMrl1Tp+UrE=;
        b=ayKkUXIVUvBVexRtwNwgce1RMAiebU144qRN3oUWK3kNs1lPOCXxXUzGRvQjQMctq5
         dnWg8Ki4Y84nWuAht9IS4t/zSpHM9Vg2yyrf1W8w9Xa9vfSvXqekpE5i17T+5k7IRYUy
         BrVFHVl3piums4monnVouEbFjddtAeqjBjGOXr9DrXN0JfwTw7NJRGGrHVgIAGOEwZ8p
         +ZZ2sdcA58jV6cuVAPyskI1thb4EuDU+67R54Ps57AiuGVCTXkMKeiWcr2cSPN9t42EM
         xH9F4s3kVN0U1UtY8HTYOA2NOoP1nsnnsHKvottveNgHKnY42MIPtfTVPKKJDM4HH4Rm
         gkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320971; x=1771925771;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jppHwni8U4RDg8yXe+tFiHh3KGo6bZRPsMrl1Tp+UrE=;
        b=oKNB9HepSw7uCyfLq/fQBHaTXlqIX6fkGnF1UDUXvPN9CdiPbaVpIodZ5Lp4tEPM8T
         WSTuYA9aI7HeVX2JeWhx9RDBtyuN9559FJMRi68OqJ5ben9jgDdR96Ke//fcBd+KKaGU
         gp5VOPLlPXbwdvneSJVifsU/pX+ILKDNC9cUOjzpmkhpoEpp8BjS2E8lEOZePE+uuoCJ
         945sAqWHqgKVBxyYz1/6fdtRPNNAkBOOW89LONF42J/xc3urYEXXUiV6LATdueu70rUS
         ZdrYn2SHoBucXJwHNRNEeTtXCO9q5qCmX8FboGzx7t6ql10TvORiIAe0l9LRMZaEkmbq
         l3rg==
X-Forwarded-Encrypted: i=1; AJvYcCXwfq1SNlPfxWauI5vtVBncsFDJqb/SS5S3/wbcBBtylqvSTDlVgeybAvQDFyZ3yHQ99R4DUwiUAxbsO78=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5UJG9YKMjSquPLU0oV543cs4W+cg4K7hkXgn6OOW1XjAbWDWV
	Ge0JPB/LAX1QRO/uttxOiEfzRVcoLJwf79Gz/Gwu6h6mBvb8WB8f5BVu
X-Gm-Gg: AZuq6aJvFPUPJe5svEqQfgvw7cRP/g1W+3gPzrIMLfZqp/FfJhFPcVBft/0f7A2xMf8
	OoKH27S5iyhv46wq9JQEXeSVea28LsNxOOT00i4G45IXKuNB3SogZTBrYNzZjzfHILU+/mIPYgx
	Tcwkii4x+oqXHzUxKtzclQspsoTx+NXI1Pg/4vg1xesNekRPvZroGLXp3Imrt3G1p5q3VwrO+Y7
	QkaEkSZDr65YZvIpzp2Q4ZsQ1sCF7xjbTo5lZx3toqGe5c5JVzoHM7OHnK5bQQ+Uiveg3mhQ8Oy
	2tU3YC57dZSA5aKj5rFs+fSVfaEwTzp7YIiG/rELPLQEfKwFjf7Qq30APcK/JLkMhIxYjWZIwgM
	j54s71YdX2HW1l9gARKFyEqRLamT21X7dVsQL5LmXLT2qVPeMbszfxhYrOMuyF9fQChFPCu+SNf
	2qGo4mRJ3eMW9kTg==
X-Received: by 2002:a05:6a00:178c:b0:81f:4999:ae46 with SMTP id d2e1a72fcca58-824d961c463mr8786460b3a.48.1771320970655;
        Tue, 17 Feb 2026 01:36:10 -0800 (PST)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm12274707b3a.30.2026.02.17.01.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:36:09 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, hbathini@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mhiramat@kernel.org, Nicholas Piggin <npiggin@gmail.com>, Sayali Patil <sayalip@linux.ibm.com>
Subject: Re: [PATCH 0/1] powerpc: Fix kuap warnings
In-Reply-To: <26372850-476d-457f-ba97-9119cf81d376@linux.ibm.com>
Date: Tue, 17 Feb 2026 15:01:48 +0530
Message-ID: <87ikbvd8cb.ritesh.list@gmail.com>
References: <20260109064917.777587-1-sshegde@linux.ibm.com> <a42acab4-274b-4e5e-804b-bb07a26058c7@kernel.org> <fe9b9c66-d1cd-4570-91fa-54329d8c6a37@linux.ibm.com> <336d274e-c831-4af9-ae65-42908b3c2c61@kernel.org> <26372850-476d-457f-ba97-9119cf81d376@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,lists.ozlabs.org,goodmis.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-16893-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:npiggin@gmail.com,m:sayalip@linux.ibm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C203814A747
X-Rspamd-Action: no action

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

>
> Sorry, I forgot to update.
>
> I spoke to ritesh a while ago and someone with better knowledge in
> this area will work on a proper fix for this.

Sorry about the delay in getting back to this. Sayali from our team 
has been looking into this. She is soon going to post the fix which is
basd upon Christophe suggestion. 

-ritesh


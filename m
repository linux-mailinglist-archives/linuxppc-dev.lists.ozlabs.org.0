Return-Path: <linuxppc-dev+bounces-17711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MUhEYj9p2mlnAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:38:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08791FDBB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:38:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQnfD1ywWz3bp0;
	Wed, 04 Mar 2026 20:38:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772617092;
	cv=none; b=G9py7/J9iER9ecn7QFieWvUphFpDVs3c1I9B7o07kt8f3rokmg1FHh+EAu40geTeZf4egoMriWdG6Irxg5PhcqbygHjnJp49h1vBTAdHO4qwkanTBK6egmMOLNUrczNKHwqXACizvvjbOzSBvWfqDm93LLRjzGcCXUBDsCSh25PWoCx2NjK4LlpmFe2Gxv5p0wfvkYKa/2mZJ4/DJGkQBc/5ASf2BJ+Q2xqXWO/8tkHzF9xbANJ88GOibS0ZUoVCwVOIDHCfnSD1jD+FSny4T6LY9tk7Cj4mvzdm6hA/oDn8+2XFsv34KGjbcFyQWiOYhGYZ3TzO05AWO5k7oney7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772617092; c=relaxed/relaxed;
	bh=fiJO/9et5qVDOSGM+mBfYqTF5/rX7jCVRCuOvkdHbvU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=jRHb0c/2VESg+ON1yhdv2KAe8qy8JZCKDamA+Mg/b9wtbXFP2XOxzT/EmTb6gXTe+ZcNPusGPHaGw7alDMhSngroXeP0pNiNVOXdA/uXGBL1qh2Tq6Eo4udCHXjlWAZFEXVyxoG8/0f4fMQWfBRP+Q5nx2yyRPSq8EZ3lYumhQ2lucahZyeOF1rp2f+epMVo15h+nWqKSf6wzlCmdh/jVUUUZn791AzV9VCmAOIjdTk5HtdAryX3dVRsmrh0JHPErLfjNkKDwna/t79RNswPPq5+m/blQTlwtVR7gZtcSS0xnmvAsQg3mI2P7kv3LhEq4a8+VUbbwB9JklpzHp15bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T499rWCg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T499rWCg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQnfC2Ydzz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:38:10 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2aae4816912so44588425ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772617088; x=1773221888; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiJO/9et5qVDOSGM+mBfYqTF5/rX7jCVRCuOvkdHbvU=;
        b=T499rWCgBYtG4DvhM4fUJn9QLiS5DYB0Sd2qfc3C6+B/yK9KDW6PoHrwN/4sn1Mlam
         bkxzKYDIs6h10thJtd6f1vMjXoNA+NsM4QtLtffV/RLX9oWC4+brbV2VhuXTofhDc5nA
         nwMOTfw7H4eGbiXZdHJnrh+NQ9Eocdn5gOU18sx+/4W5LLr58kAOxZXOPAVhENjGYTFW
         7DA4wcpYRpsY9YMIzTbXOemTkqbUhHnTF26ByZxi1zMCMRaJ3k1KTm0onMOOeZ6sSrRf
         qsw5+tMmmH7E9s8Kz9tkN+5OQzQpOFSl8qZf+pxuMwhkiJB5ioL0VOBgQKBowBZqbqw+
         wi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772617088; x=1773221888;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fiJO/9et5qVDOSGM+mBfYqTF5/rX7jCVRCuOvkdHbvU=;
        b=jqpt3i0LyMkvYX5XS0eHXJC3JwrfB1iiPY/8xNSZNT8eXv7nRkfqO91tUy/mX2Oj4g
         m3f5ClsMVP/EeMRcxPz6+NXZ0JO8sKPswcroknUobANWCEGDTyHvRx2pj1xO7hRRjzSJ
         kSkm1FLsqfmASr7TkM881JUQRB5xuXDsuYslo3Xvn5a3/FImULLlbDkghTesTE+CqVgp
         4sEHmdm8l7z1OT2daqSZXJjcK3YD9Be0q75GhChdwdx2Fl7gDcyvRonz7JMf53K0b0Vs
         AkWzRDnvLJe3DbbgQu6vYbswnz4/8o9QbpR8J0KHMqgwB7frUvUYwkw+3oRJl8g2FNXn
         zdRw==
X-Forwarded-Encrypted: i=1; AJvYcCVxF/dGlpkJthOpHx4RM4DlsLm6StEOot2ggWilWTYhC6/2gUkohCimVsQzPVvGZdjHu2Pk89S2R/OqYFQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy5Y/Ilm8grv1VBU9digiJbO85avf00EJ5kb6HHdCAP2oAVv8QP
	kfnCTpATOKcP8mIC133buXavcmcQ2LJQh4xj0qgWIaJmCM9jAXXxD3TH
X-Gm-Gg: ATEYQzw/NPIWhiAHK1BrTNB/SFyRAyIkO85FnfTXT3dJ/eoxTmJVE0pz0jGR36Dl4IC
	2vXtIwDCyU/px+eRu03ZBdhhxkGsbizxmG6g+Raxfcr+QGcmBihqVFFIWWxG33LR/b4aPNSEsRZ
	jP5q/w8LuZAFGCtonzM2v01IXubnXAh9dV1bUt1XexJHw5DsBRLXJ5c9qRyfgTXPWvOyXwpfjEr
	8r+H75m59/w/uIgYcI0Wg130s6Toqp/uF4l0oLsRWyrHe7En2EvW9cTqpl4Kxz3V7sx+LXT4BUx
	usd/wha8VcJAmuAmxlBNbyF2/aDqCvBYsQ99RAvCEE61fLMc3ORMIXJWqRqS9JX+ijD1n60eN5w
	ZRe5RbJBay2SeAzegO0Wj+QLDgZeNBhKVx8POTMj4L9ZIEebXBTClpSI2MgqLHGP0avLXknl/EW
	eKDvkuehho4UHf1PoO
X-Received: by 2002:a17:902:da4d:b0:2ae:593c:48fe with SMTP id d9443c01a7336-2ae6aa06a22mr11815955ad.13.1772617088564;
        Wed, 04 Mar 2026 01:38:08 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa65sm190048445ad.58.2026.03.04.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:38:07 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [RFC v1 10/10] powerpc: Add MMU_FTRS_POSSIBLE & MMU_FTRS_ALWAYS
In-Reply-To: <727cad61-9df9-473b-9a79-f70ad1cd4e3e@kernel.org>
Date: Wed, 04 Mar 2026 14:53:49 +0530
Message-ID: <87ikbcj6ca.ritesh.list@gmail.com>
References: <cover.1772013273.git.ritesh.list@gmail.com> <c57b1c00145a2db1a1b4feec94cfc2917e4877af.1772013273.git.ritesh.list@gmail.com> <727cad61-9df9-473b-9a79-f70ad1cd4e3e@kernel.org>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E08791FDBB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17711-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:hughd@google.com,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:aneesh.kumar@kernel.org,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:

> Le 25/02/2026 à 12:04, Ritesh Harjani (IBM) a écrit :
>> Similar to CPU_FTRS_[POSSIBLE|ALWAYS], let's also print
>> MMU_FTRS_[ALWAYS|ALWAYS]. This has some useful data to capture during
>> bootup.
>
> The patch subject is misleading, should be something like:
>
> powerpc: Print MMU_FTRS_POSSIBLE & MMU_FTRS_ALWAYS at startup
>

Sure make sense. I will update that in v2. 

> With that fixed, Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Thanks a lot Christophe, for reviewing the entire series. 

In v2, I am planning to fix 2 more kernel warnings, identified via
selftests (currently working on them).

-ritesh


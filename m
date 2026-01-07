Return-Path: <linuxppc-dev+bounces-15362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D8FCFCBFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:10:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMgY2DGfz2yFh;
	Wed, 07 Jan 2026 20:10:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777001;
	cv=none; b=ZrO8IYUyNLeigwrhViaCbGcEMeQap+zxpVYiT5hjFt0Onc5t9T+Gni7hf30DKmCoJqRtCWcDZtsfuS98xKBjpvhfvT19TbmBHqE8+LlWua4CqIOypJ3YswFVce1FO3PmSFAF6AuMI/X3uKbRZUsSVLCEfe/7t9Ybt6h2KbkeNw1CKxLWuD82JphNvBfKY6sieGrY2eVgMifSuXW/nJGgihvKCdsRPSaeKAxeaIVwvfUdKkgf1sr8j/TMcPWR1f94Wq6asfTGPmevC0wciR8sIlwARl8DkfaSoq6CQy7C+to1hFzXznk3gr0oLqDWcxubWveTqejUfQO9kKZ7lTWg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777001; c=relaxed/relaxed;
	bh=ITGXpoqgE+Yt+YnoqNOlVGgwwmt775Q1OOfdU/GcUiI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WKDkymjn77Ca3sPL/cG4s5BoXz0Y0mT65malmcdN1oNO0NzAATcqbt+1xz307AIdd6Gl9HwC4viCFkJNEf0Kfe2zWZtXBjAKK8KqnXKV/dnZMh5MEHLQpGcUchn4KspYBXTr0LFw9rhTr1KrBzO+dSiGoln2h8N1FncBdmyG5FaKMVckAL4U8wcCUpcrKdupQOuqlilVcaaMtBZunbhrfUveWoK2fO4xmzSYNhjvFHlVevNLevAqD0m4dCmLkiVq6KwhhleG4ekFZ4rA/TRkRIz2Mjsus8GFkTQVYggm4LbCOtdc+fsvbmhCgnYDkW4cXqO4tiT8HWw/VnZNlp/vQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bjUWkRrM; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xvPajImk; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bjUWkRrM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xvPajImk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMgW3BqJz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:09:59 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767776960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ITGXpoqgE+Yt+YnoqNOlVGgwwmt775Q1OOfdU/GcUiI=;
	b=bjUWkRrMpGs3lrP/tCBanjxTD22rdcDxTtSQKF8VGVRQiyBSKj0z18dsd6yqmN2bHOH873
	/Y+RH9ViDt2MWcvZxXuB1YLWnx9LLfEbQEjHJbcGOAZNw8oyDwcCKaaGYalc53Yzu+wwsy
	XS3kswar98V/T1zhZ1zuZ5s4ozb9tZtLS5yK50UN2SEaouBzVRRXNPO9XTwfhSDHtpCrgg
	jPn7eOOWLfQgzgc90tJzvkqShv+9OQiYfJ1tc2NeEtJHG848X/XQYylOEV5u2YbcVXHENC
	gCDFxFiCiRGchdDNyroqKBw4M+5o6AI1/gMfEhv+u8ciwePWWJdaK78pbq4+Qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767776960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ITGXpoqgE+Yt+YnoqNOlVGgwwmt775Q1OOfdU/GcUiI=;
	b=xvPajImkWPoT4fg0h3ww3f6YIfLhIQ83WBgf/kbeMZpxu4OrP4rcVQmuPtQZknEhbsHgpE
	ffswqriMz0WEOABA==
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de,
 maz@kernel.org, gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>
Subject: Re: [bug report] powerpc: per device MSI irq domain
In-Reply-To: <c0718b2d-a4dc-4945-a372-4b0344ef5e29@linux.ibm.com>
References: <6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com>
 <87qztawmiv.fsf@yellow.woof>
 <f82d1224-509f-446c-8dee-13e28429b52b@linux.ibm.com>
 <87jyyzisjj.fsf@yellow.woof>
 <d142f044-a560-4b59-8dd8-5568d5b9d21f@linux.ibm.com>
 <c0718b2d-a4dc-4945-a372-4b0344ef5e29@linux.ibm.com>
Date: Wed, 07 Jan 2026 10:09:19 +0100
Message-ID: <87jyxt7ps0.fsf@yellow.woof>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Nilay Shroff <nilay@linux.ibm.com> writes:
> Hi Nam,
>
> A gentle ping on this one...
>
> I just rebased to the latest kernel and found that this patch is not 
> yet made to the upstream. So may I ask you to submit this change now 
> formally to the upstream?

I submitted it, but it hasn't been applied:
https://lore.kernel.org/linuxppc-dev/20251208133949.3651991-1-namcao@linutronix.de/

Apparently I had a typo with your email in the patch (in my defense, I
copied it from you). Let me send v2, there's something else I would like
to change too.

Nam


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A8780AEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 13:19:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=djSPoo8X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRzsg4CQGz3cTX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 21:19:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=djSPoo8X;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRzrn08lWz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 21:18:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692357512;
	bh=4PjeEkx4aBPMQUwm4BVpDzhj+bdvfmdCom8/6aO1EuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=djSPoo8XEakClexedz5VHK0XAnbYFl1AB9sSKJR/+v0qiw2S/iJq1YYIGfNyof0Pj
	 AjroU+w+RbY47+XuZ6VPNJHDu4Qzvex5keZ4B1vfkzcynv7YuIkRYub97rSjRF/ZrM
	 fO5EbAZz3DNS1NJOq/EZfZEKYDhJK4md1Empx6ggh+9W1tuu1lkLgnLbu/E3nwJlfc
	 nJUZYadVeJBPrj98Dz8MLr33eFmTks7Vr300gmNZnxCyCq7Mli0Gh95JTTIgqtJSAJ
	 u35yf9Q7RiMn+P3WSEfwFpb3ViL74meGV+Kgs6qQnkGLvtMr3ZEV1UwWto3F6DtE59
	 Rs9acNe23ublQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRzrj65skz4wb0;
	Fri, 18 Aug 2023 21:18:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Enable generic cpu idle-loop
In-Reply-To: <20230818050739.827851-1-vaibhav@linux.ibm.com>
References: <20230818050739.827851-1-vaibhav@linux.ibm.com>
Date: Fri, 18 Aug 2023 21:18:24 +1000
Message-ID: <875y5cwqdb.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Randy Dunlap <rdunlap@infradead.org>, "Steven
 Rostedt \(Google\)" <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> This minor patch enables config option GENERIC_IDLE_POLL_SETUP for arch
> powerpc. This should add support for kernel param 'nohlt'.

Which is named after an 8086 instruction :), but oh well.

> Powerpc kernel also supports another kernel boot-time param called
> 'powersave' which can also be used to disable all cpu idle-states and
> forces CPU to an idle-loop similar to what cpu_idle_poll() does. This
> patch however makes powerpc kernel-parameters better aligned to the
> generic boot-time parameters.

It would be nice if we could make our powersave=off parameter just
enable this generic logic.

Have you looked at if that's possible? At a glance it looks like it
should be, when cpu_idle_force_poll is true do_idle() never calls
cpuidle_idle_call(), so the cpuidle drivers are never invoked.

cheers

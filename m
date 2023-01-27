Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA867E70A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 14:49:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3JpJ4d8zz3fHH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:49:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W2WmomO6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RapVKdmr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W2WmomO6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RapVKdmr;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3JnJ2XT8z3fDf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 00:48:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674827292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kw/UexsSySmCBQfo+jBXXjDxKL8QdcF+X/4S+iGj/Pc=;
	b=W2WmomO6w8/n8QCQEb5ppjaGqDrwwWDfFQnzWUF7pqbMfPtC4oZ+p2cI+asFAXV8WHHfJ2
	c5F3kfBCwfv4AHM+Xou7okC5kKvbUknnZHi2Apb8tXsEytJl+ZXfC4SuSUP6m33Gt5PbEV
	eyNYBhMyG/KaBqOeewrsbeD8Zy/h7mQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674827293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kw/UexsSySmCBQfo+jBXXjDxKL8QdcF+X/4S+iGj/Pc=;
	b=RapVKdmrVIOHk5tUnzsoiudwF5qESuS/DWsYXfjlOCqYHBJp6HY6VOlli76hcEdGNkbrk3
	6Pfky8OGXcIiXntLFVAbu74/ZdrrIxbyNKg7xvRueh5IQSwtayBLwEY1MLKU4YfiAkZtfo
	dl6Q+vnJZMxWenB9wuoneHRhon9Y41Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-4jfb2mIeMtO6M4x2NXRfrg-1; Fri, 27 Jan 2023 08:48:09 -0500
X-MC-Unique: 4jfb2mIeMtO6M4x2NXRfrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B97D585A588;
	Fri, 27 Jan 2023 13:48:08 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFD640C141B;
	Fri, 27 Jan 2023 13:48:07 +0000 (UTC)
Date: Fri, 27 Jan 2023 08:48:06 -0500
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 0/2] powerpc: Fix livepatch module re-patching issue
Message-ID: <Y9PWFp29nAdtdPqp@redhat.com>
References: <cover.1674617130.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674617130.git.jpoimboe@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 24, 2023 at 07:38:03PM -0800, Josh Poimboeuf wrote:
> Fix a livepatch bug seen when reloading a patched module.
> 
> This is the powerpc counterpart to Song Liu's fix for a similar issue on
> x86:
> 
>   https://lkml.kernel.org/lkml/20230121004945.697003-2-song@kernel.org
> 
> Josh Poimboeuf (2):
>   powerpc/module_64: Improve restore_r2() return semantics
>   powerpc/module_64: Fix "expected nop" error on module re-patching
> 
>  arch/powerpc/kernel/module_64.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> -- 
> 2.39.0
> 

For the series,

Reviewed-and-tested-by: Joe Lawrence <joe.lawrence@redhat.com>

--
Joe


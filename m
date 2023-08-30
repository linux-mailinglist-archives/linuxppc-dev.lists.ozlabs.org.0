Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4078D126
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 02:33:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Dw+eJVuS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rb4ys3sjtz3c4R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 10:33:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Dw+eJVuS;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rb4xh2KrRz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 10:32:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693355539;
	bh=rtqXqefWaBdTc7Vn+73gF/lqYmAcwv/JWQvT26wbRSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dw+eJVuSXBbZmTNgDCl9I9pzEsIFC4a0h4ZYqDY5K0Fs2xZja4AOo5QTJg+6auudC
	 JhgQ4R+fZoowT3VPKIAXTJqagwnq2h7AB8MoGA1CSRZ7Lc8zGsiVyND2jwzDFVS/uM
	 04n/Azom2vQmSJuOE/oGtJRYAVkYK+Y4zu9Bm1xHEeMJWzmlRbmr5kgJ1ZFhZ3zKBd
	 OPr76+tCyHGusUkwvOZHXrWm+tSpdkgYUzNZc9qSN7F/wwp4pvjEbCE4leu6xsf+sN
	 9oo1OeMqU+hqH4SOYkKD/jy7XLFXNp300yQ+Y4pAHQ8o0DKMyoN+BNTlpzz0Vl/7UG
	 KEs+oveCmJBKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rb4xb2X0Dz4wd0;
	Wed, 30 Aug 2023 10:32:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joe Lawrence <joe.lawrence@redhat.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: Recent Power changes and stack_trace_save_tsk_reliable?
In-Reply-To: <ZO4K6hflM/arMjse@redhat.com>
References: <ZO4K6hflM/arMjse@redhat.com>
Date: Wed, 30 Aug 2023 10:32:15 +1000
Message-ID: <87o7ipxtdc.fsf@mail.lhotse>
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
Cc: live-patching@vger.kernel.org, Joe Lawrence <joe.lawrence@redhat.com>, Ryan Sullivan <rysulliv@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joe Lawrence <joe.lawrence@redhat.com> writes:
> Hi ppc-dev list,
>
> We noticed that our kpatch integration tests started failing on ppc64le
> when targeting the upstream v6.4 kernel, and then confirmed that the
> in-tree livepatching kselftests similarly fail, too.  From the kselftest
> results, it appears that livepatch transitions are no longer completing.

Hi Joe,

Thanks for the report.

I thought I was running the livepatch tests, but looks like somewhere
along the line my kernel .config lost CONFIG_TEST_LIVEPATCH=m, so I have
been running the test but it just skips. :/

I can reproduce the failure, and will see if I can bisect it more
successfully.

cheers

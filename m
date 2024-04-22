Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D67868ACE6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 15:37:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VmQC1AnE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNRBD3rN8z3dRm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 23:37:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VmQC1AnE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNR8d32h5z3dS5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 23:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713792945;
	bh=8ei9GbJZW97AshSmMUhY3QUz1TIss6EgYgqIK+FZiT4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VmQC1AnEp5KshUWP5OrTUahsLDLn7rRptYebO2HDfidykAJXNQMqwvnTsA0dTHJHQ
	 Btwys8Y5eOQVoJj023GQ7E1j2YGsL0LoovuKQzMYOHnMyB3SZUfHZ+toYKYVUYOZ6J
	 AYh9I6qaifGsAQYm6ZUJnzaafutw5m3pChbDYqA+lJLgz9nNbjmHiTQOCXNSfvvkmo
	 9PGIlwZKNTiiz/1E7L0ywoc2IpCAHBD9eJZuTtOd++uxd51W0Kl13WMd3wLtrZzUvt
	 NgjVhdtWLcqpQCd0KIx6pCkidOb1VmF+FeAOizVMHFrJw0X6F/Dxe63SDK2Bqs0Ouq
	 rE1VNZJSWDFFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNR8d1MWnz4wc1;
	Mon, 22 Apr 2024 23:35:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests/powerpc: Install tests in sub-directories
In-Reply-To: <20240422132746.1790844-1-mpe@ellerman.id.au>
References: <20240422132746.1790844-1-mpe@ellerman.id.au>
Date: Mon, 22 Apr 2024 23:35:44 +1000
Message-ID: <87h6ftjz9r.fsf@mail.lhotse>
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
Cc: spoorthy@linux.ibm.com, maddy@linux.ibm.com, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> The sources for the powerpc selftests are arranged into sub-directories.
> However when the tests are built and installed, the sub-directories are
> squashed, losing the structure.

This is missing a preparatory patch, new version coming.

cheers

Return-Path: <linuxppc-dev+bounces-12531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 923AFB9444F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 07:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cW7D83nSBz3cYP;
	Tue, 23 Sep 2025 15:03:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758603816;
	cv=none; b=lO1PFdTu/ZxBVfcDJjatM7y8wsmPeBlsONS3J1uqcLB5YzvZL5hUf7+TnAhz3DHwSrdJe79J+2h7C9s6q38AKeaqyzTMu46qAXIBA0qbPyhoJtp3eB/XQ4zuwwX5bCsj4kvHGjOAUcqgoxJ3XAGOYU+qyMQ5Yhe8EOmnhaTqTfg7chASE+OpMfARU3/JqsRxWtk1X0DupLnH2mZYm2sQuoHXvoah/yUQcd0KMISsIAvo4JG+mGgTG7CFujv8Rrfvje11/PkwEjKi8qf/Q+ir5RIlw80wS9KB9+zNrU/2naJzJJDtCE0sp/L3p9MTS3tmWlKtue13cKDcH2kLpKNOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758603816; c=relaxed/relaxed;
	bh=uOY1GGFo0uQy4Ubq/opMB+IeU97gbHGIlffkHsb6CZQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=akQP4LIIZgSlMMYZ0yXb27QOF0161uhuJrLgGQb/NEEnL+Lzd0G69SrBKmZUcFTYxv8thmsL9zkQnStjydKo3rnJ2ojmfxL9wV8fzD13+M/WRds3gHcpZsb6L2Lcc6iIBHtImlNKG+X9/+CWIEzjhZAUVCC4HB4yqzUMrC2QHXCTaqUENfWed4L9k7HeRd8Gi3dVjZdKe1ph7SrMs5+qhST/AhaOjOO3/byH47i/vOrNo6+9OotYXaN1RZb3VcTi1bXPLlYKmtp+3yqUi3V8SwRRy3k/k385Mtl+gb8/NtsiEICiFWcwU0RVOBAdS+ZQyHg4QCH7wHG8eYAycMW3tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uFXm8wMN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RVp22cK1; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uFXm8wMN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RVp22cK1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cW7D70g3lz2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 15:03:35 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758603802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOY1GGFo0uQy4Ubq/opMB+IeU97gbHGIlffkHsb6CZQ=;
	b=uFXm8wMNJKtckl+Fm0Nw6vLfMJfkd0nKggUHYZrCms2/jxnOuDNHkicdaIGbukfErQ4cI/
	ZgPmmhE7huAHEEW0CqlxKzOEHvvq+dmNewhpObuFHb/jfNtKF0VLK9Ska747HHOWNOryJA
	Xqc8nIBLWxBJJWztvCh40P6PUmemE1a/cvylDfK24ogj+JGDbqLeHYeDRwbZx4Qs8nDx++
	u6A6HotlCzCBiyQsQCE9BzTOwzkzcKywJFhvo2MhWpYesESzwek806mcIadenV6necAPgB
	bsWUb7/iJ7r1KwHcSMzgnWg27PYN9GQdKU+QPZN3NNapKbmwvw9l3XvVgh0yAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758603802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOY1GGFo0uQy4Ubq/opMB+IeU97gbHGIlffkHsb6CZQ=;
	b=RVp22cK1k9+3SSiBbAonOGTtJmrsmdU0c4F2L3tXokxc6TPNpEEsdTpPGhrmkzUuGVM9G0
	ogRJCcmywVervOAg==
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] genirq/msi: Remove msi_post_free()
In-Reply-To: <20250916061007.964005-1-namcao@linutronix.de>
References: <20250916061007.964005-1-namcao@linutronix.de>
Date: Tue, 23 Sep 2025 07:03:17 +0200
Message-ID: <87wm5p4v6y.fsf@yellow.woof>
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

Nam Cao <namcao@linutronix.de> writes:
> The only user of msi_post_free() - powerpc/pseries - has been changed to
> use msi_teardown().
>
> Remove this unused callback.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> This patch depends on the powerpc/series conversion patch, which is
> currently in powerpc tree:
> https://lore.kernel.org/lkml/c7a6d8f27fd217021dea4daad777e81a525ae460.1754903590.git.namcao@linutronix.de/
>
> I think it is most convenient to apply this patch to powerpc tree, if
> everyone is okay with that?

Maddy, do you mind picking this up?

Nam


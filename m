Return-Path: <linuxppc-dev+bounces-10623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C79B1A94D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 20:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwm1n5b0Mz3bby;
	Tue,  5 Aug 2025 04:54:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754333661;
	cv=none; b=DwFwddkwqB6Kvmzauj7OYaLmTm/D0ySTYq+obyM5L5OJaTl8VJQWbgwadLaFPrfwc1aSizHrZ51dHApOPcxQ9I2nDdbK2hCfx/tayqvl0LvrpMWWpO8uk3Cf2rYgMz+j6BexNNJellkmCsps+C1P184x/GG1hvEbEOLU2SQl6W+tEUwvdsRDskJ5F+YrekXecLgNJPBxBURjYI5gGg56FZJGc2uVpS+Mo+Wt+MDa53/BhHiwrDwnLt7x19ZniFagC49c8+G8343jNfcF+LzWJlIyWwobynKqaMil04wRlfz+0YgSYj/yct0B+PTR7/IYmk9DAcm7HOUHqQYgGMMbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754333661; c=relaxed/relaxed;
	bh=XJyz1O9K/vY7yNoOy0S8THUjh66dbK7BRPkmiUcVcjw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wjig5w7MFXAMvuVbtfNwTObIx+umuzo3P+3sMKfVZ35+sTSTdrUg0qMBWO73FLszt6hvggEpj0BcltT+YfyiAJF1EwZJufrhf8mxkQA1subKzrNEE4ba/tz+YITdNaS6CWsxToAvvwOz77leRzgZkswqfIiOo2kciTTPo31zZypOkQL6YTSse5rKZ699bgWHPa3b9qiCtTa65kOHwONPBOKHXT/ro+xqW5zZfyd7YUCAIrFnusyGkK+a5OfBaMetkTONmHPLWyUUcxyzMZbeZPVL92KY9Ga5qbVlEMj9lEX3VTX7AVzC5upLth4jHO2VT8MpthCemLNeuQjE35n4Gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2CMkBxZ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2CMkBxZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwm1m70mgz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 04:54:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1CEAA5597D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 18:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E61CC4CEE7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754333658;
	bh=OVpUpqmOXJHIsX56ysFWT4VtImCRGWkE6ZdTmbX7oT4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N2CMkBxZ1S+HQ56x5vnP+i+woWUjq9TLZXmPqWoxopD2/2m8bJbrMTss8S0WIQ/in
	 aYmo0Rmb2YCC+Im+Ouj3K52zWSlRmW2wYqNFllXwvO0ODQkTiyrGnUPWWUmo/rCR0U
	 proe4J0cAJB59G1+4BtPMzS3wnmpZL6YvCBPQoyGQ5Gab9Ck6dPANLmsWsE2x957QK
	 zVajVLGqJWYLPDm9Q4nROhShTVHiD7YVXQu6CJo/CCyL94gVTE66AYXHmadAKvjObL
	 bzGNx5hE2hSZc/2R0h4rNQmAJbpU9IJDXAo8MY/xYFuyXAXvKVDYSp2AqnoN1fG6zS
	 X6ZXqol8RTZCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6265FC41613; Mon,  4 Aug 2025 18:54:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 220407] arch/powerpc/boot/types.h:43:13: error: 'bool' cannot
 be defined via 'typedef' when building with GCC 15
Date: Mon, 04 Aug 2025 18:54:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220407-206035-jmhtneMKDz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220407-206035@https.bugzilla.kernel.org/>
References: <bug-220407-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D220407

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=


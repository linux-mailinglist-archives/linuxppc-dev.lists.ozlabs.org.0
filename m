Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B7D618CEC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 00:45:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3L3t1kTBz3cD6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 10:45:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LPXgbFBX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LPXgbFBX;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3L2w2bJPz3bbb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 10:44:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4F2E8CE2942
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 23:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B28BCC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 23:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667519089;
	bh=mISbEP4nEx4zm1pdOjbbH7rX5tnHKhqZ8KYQGNAu2WE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LPXgbFBX+4SErTsNyDNH7Edqs7Vk7rCVcvxzs86vb3L7tKFFsUVZURk/Z2+HnlrIy
	 f8OndOQXlIKBRZNY29ymDAoc0GL8AGpvnl8jqByjuRFxxoDGnMOSyRb86Hyd73FWb/
	 UiUggAjqoeDB3j4LDDY09BVLYLUvNpzJwwXYjSbduAB3q3JkK2mbhPr7C9D7/Oe0XQ
	 I+wnuWifgcP5j0UpgYLpwpHNS2ESD+eALnS1y+dC626iJY9Ppwliu+c/y2IqoJdilV
	 chjURwyhapTWumjYCSD18Tz5j3WGeGUw56TgiRARJ8+QP01zO6byyI8d+ew3e9wiuK
	 Ujyf/RUHAZQlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94C8DC433E6; Thu,  3 Nov 2022 23:44:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216407] OF: unittest fails some tests on ppc and ppc64 (###
 dt-test ### end of unittest - 266 passed, 6 failed)
Date: Thu, 03 Nov 2022 23:44:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216407-206035-jUSN03aMFJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216407-206035@https.bugzilla.kernel.org/>
References: <bug-216407-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216407

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303129
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303129&action=3Dedit
dmesg (kernel 6.1-rc3, Talos II)

No change on 6.1-rc3.

 # dmesg | grep FAIL
[   51.237023] ### dt-test ### FAIL of_unittest_dma_ranges_one():927
of_dma_get_range: wrong phys addr 0x0000000000000000 (expecting 20000000) on
node /testcase-data/address-tests/device@70000000
[   51.237036] ### dt-test ### FAIL of_unittest_dma_ranges_one():930
of_dma_get_range: wrong DMA addr 0x0000000020000000 (expecting 0) on node
/testcase-data/address-tests/device@70000000
[   51.237064] ### dt-test ### FAIL of_unittest_dma_ranges_one():927
of_dma_get_range: wrong phys addr 0x0000000100000000 (expecting 20000000) on
node /testcase-data/address-tests/bus@80000000/device@1000
[   51.237078] ### dt-test ### FAIL of_unittest_dma_ranges_one():930
of_dma_get_range: wrong DMA addr 0x0000000020000000 (expecting 100000000) on
node /testcase-data/address-tests/bus@80000000/device@1000
[   51.237117] ### dt-test ### FAIL of_unittest_dma_ranges_one():927
of_dma_get_range: wrong phys addr 0x0000000080000000 (expecting 20000000) on
node /testcase-data/address-tests/pci@90000000
[   51.237128] ### dt-test ### FAIL of_unittest_dma_ranges_one():930
of_dma_get_range: wrong DMA addr 0x0000000020000000 (expecting 80000000) on
node /testcase-data/address-tests/pci@90000000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

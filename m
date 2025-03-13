Return-Path: <linuxppc-dev+bounces-6942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F91A5EA8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 05:27:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCvbl1F6Vz30D3;
	Thu, 13 Mar 2025 15:27:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741840035;
	cv=none; b=JbbrStxaNrBdMDgLFna+0b8SOs6bbMNxFxInAmU/QhS5uTIU4uMZW7rxlJuaH4m7XfpCq4x2SsnTpKh43F9ra0ZXiRgs7IJtxu/6IvOMUl/parUWe76KW46KEwYODP6xXeqqxxvSHn459AH9Cdgd9vatUV1t5Q4VueXlL8ew1UGJvRU9R/5NLPLpC3OksHN/I3hwOn+3oaywmV7DWz42fx0ArKYRKZuWvmcsIHneKbpxoRJ6CIO28moRB17ap6+uHHZ06Ukym+4YgIWDnwbx84p5gqOzr8MhuByzjS3uetcArP/dx2B8D9GoR4OVmEL/PLAdgaqWfzeL64kik1CCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741840035; c=relaxed/relaxed;
	bh=jg+w1DC3NQVP4ft2a9Cfe6VN/QxEpG/4sB4ypk7l1R0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWQubmP9zWgSXTSA3W+7muVk3WiVHvs/6MYcbkwJMsUV1lch8tAyIZS92L9BRM/1UKv1KDtd88vREz8NXKe/mY8xwyfvsdcyhhLlz4Q5bFMMe2oS6EmJtN5MyvuXu+bE48ELRPt9x69f5Ir/NVHHvbCp+zvYJ5ARc9Gz78Khs7c6Psw+xIFtMPrD5sh6tK8t6dovKlBjMdDDD9vAbS0C80or/PRgWedlO41fiYr1Nlt0mVzTlS+OMKzqJhTcFtAIjqaCTspXYuTHj+RRnZ5bLCtbpMoQ2ifCQkP+lOYp+iZK0/PgkXK24hIT3mWVBPj4aYhO4uTLLunRuRhLvrvEvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=v7xtbCv0; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=v7xtbCv0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCvbf07Myz2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 15:27:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=jg+w1DC3NQVP4ft2a9Cfe6VN/QxEpG/4sB4ypk7l1R0=; b=v7xtbCv0cy23zBEBdI0h5zQrQN
	W7x5zdfl3quqyCOJESo8Edy7IJEKoFWyCOD6PErkiaW/V7nUb9lfyGGVyiCkIr6pJiM01y7sqmrCQ
	1uqA5Pg4mt7GaGPuZgH6HsO37Bpo7gXq2VAFG/Gtjd4seO3eMcpuYcD+4Rmwf0vKUE3RURn4TTGzM
	KgeJr8nDtNdFmIlPl1YLZkf6XKdDRUFWMd0BmnSBXJYJAgHAumN46Yle62DTqWW4TBvXkuJpNUAS8
	pJmnFpW2AzdDNFdw+8x+Uc99Lr1PjyZ0A+yRIKfNd880Z9WPVDg3bEtaohhKa8hKytkPiMDaCgrjB
	3HZLkp6A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tsa9u-00000008uSX-0UTc;
	Thu, 13 Mar 2025 04:27:02 +0000
Date: Thu, 13 Mar 2025 04:27:02 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org
Subject: [PATCHES] several fixes from tree-in-dcache stuff
Message-ID: <20250313042702.GU2023217@ZenIV>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Several fixes for fairly old crap - qibfs leak, a couple
of spufs ones and a spufs double-dput() memory corruptor.

This stuff sits in viro/vfs.git#fixes; individual patches
in followups.  Review would be very welcome.


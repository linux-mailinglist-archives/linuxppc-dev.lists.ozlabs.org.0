Return-Path: <linuxppc-dev+bounces-6948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47555A5EDFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 09:26:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD0w70FKRz3bp7;
	Thu, 13 Mar 2025 19:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741854406;
	cv=none; b=JPT2X4JxT5aE8HCXwSO+piujd7f0471e7hRtI0wvU5ls7owLE+rYumB2+qdNdRB8Cf5MOS1y6pBpweVxR8d7Kxew8QijXZdb/BZNJ/PeGh4rqVtXeoGV9aANjPnbt5cZOcvXLOwSN1KzgAWDJaz/rwBLT+hPnMHvobDYweysWaSvhXqsso6FT7U8ROPpnPaeP0VjvEaUtkTMFGSpwaRGxOi33VjG47lF+bvzyC86I6MbJFW6ICBCmTkRzZeWT54dBoAH0qAtqEp0g3LsoghUIDpMdoQ1C7ZI0fq65khwBCYi26rLgLnMgznOSZdz4yAm/SjOZOGDIjQ1bGje9HzSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741854406; c=relaxed/relaxed;
	bh=2gj//y+9z/vLunRuq6qlJrJFXSqyd2lrrOu5oVaOgfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tgi9Ni1KiTfbkhuV3+Q4zrCQcAxikS+R++Xxg1VBPiknYYLxFf5WahtPY9S/3PUn3sMfdZOBu4n2nrM+aq7PcEjB4j1vBypJ8dTzQloinq8+y77wkngmQpYHQaTjn7BzSjaFRc0CXLxLOTrgjR/gfl/RClgcAidwCYxOBROsQZcY22Yfdc6m1Ipf7LeUTbAtgN7wIVwz5G7m0AdxFtPEyvhov6JvJjw1UkPovSsSzABo8usDoUjgdac9+OLm2XWxcpBF1YsCyTwY/cqiY6XMpktA1Qp2Fwk6kRQNJtAoaXVnBlG0hpna9Dpplu+juS+V7EKLA9PPhDqSJZ5GGVHztA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L2lW2Di4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L2lW2Di4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD0w60Vqxz300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 19:26:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E82A1A4608A;
	Thu, 13 Mar 2025 08:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBDAC4CEEA;
	Thu, 13 Mar 2025 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741854402;
	bh=RkjUHYQt9oYOeICSHm0UffwyjfkR4DIxUYy1AeuFDp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2lW2Di4PKJfvtctKVCWjvynCN9luGhvjFRP1nNTUY+8mzjYQXS7VMVOdisFxaHf/
	 QaipGbZ0C2n0999fGxUwjuFiOPEd0er44K8ZoeHJcJSSY0rLzjByx+D8nY8snQV1wC
	 UokOqVBRfsbUaQGsr4VOe7zyFnqbeIjlq/X1VKWrkRH1mfbX0aZpINwd9XCLOKe/tz
	 BBFxPfzqqfuhblleERtv5+nqZ6EsAXebjKm2ds6tlAWYGPt/pZK8w+Tv2LFnz6D5ZN
	 kziQBIsjt+vzPp/3T6PwnQMqUfGKpb0mEyj4kI4z185QAVsnbxEokQg5IOsNMpa/Dh
	 F8eCfGo7mZ3wA==
Date: Thu, 13 Mar 2025 09:26:35 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] spufs: fix a leak on spufs_new_file() failure
Message-ID: <20250313-tilgen-fundamental-1b86d4cbc3e1@brauner>
References: <20250313042702.GU2023217@ZenIV>
 <20250313042815.GA2123707@ZenIV>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313042815.GA2123707@ZenIV>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 04:28:15AM +0000, Al Viro wrote:
> It's called from spufs_fill_dir(), and caller of that will do
> spufs_rmdir() in case of failure.  That does remove everything
> we'd managed to create, but... the problem dentry is still
> negative.  IOW, it needs to be explicitly dropped.
> 
> Fixes: 3f51dd91c807 "[PATCH] spufs: fix spufs_fill_dir error path"
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---

Reviewed-by: Christian Brauner <brauner@kernel.org>


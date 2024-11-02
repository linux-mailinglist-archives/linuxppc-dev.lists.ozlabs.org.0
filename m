Return-Path: <linuxppc-dev+bounces-2873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50B9BCE17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 14:39:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjTvX70zZz2xxr;
	Wed,  6 Nov 2024 00:39:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730813944;
	cv=none; b=O3SpiAoiMVab0TFNF97qbta39owCDVz0q/Qqw7mjIO9BKxI0KZGe0SFS2j9yG9pOtI+em1oeZ8BqBKBtXWlK0VsXMx0zCgu4ADY2slYG0TXTqOQj7AgBuxZljT0RQP9Yp71wSVND5KgtQl8U6DaG0gaUKKAPKths4/8FOIWsRNs+o+wtas/mQ6SHl23Hqfk8jepsPmA5fOCrdSEZBvAON3K1IdrfkBiSit1uRNZZ/KdGEjcuwaLmh1YDnpojUzHkiX07A943a8TPKW2MiB/4n0HHXINfzzrySGdH5sv04ruFXXYsUfwkdZSsnMMguLmt3kD/q2Zbi3WawI0UHTTJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730813944; c=relaxed/relaxed;
	bh=KYeCLSsUZRIrmEOMwxGqSfD7V2RsNkns3qvfU6C43UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3rxSoieML7hgnecu484c78cFODzFmHTqhGatRZQZ0fqHeetSkEuUb8iIdHew1/0wgsLer98FfrjKRFU4GBo0WQ6AbfewIE8cAOkXBMzzKXcKrmVhq9O+kTkU7kPgWa2hBG12oaXCtfSal12mPbHxCMZ1effBtAMWxKJ8xYHqniWpwHWibhdSrQQeRMVvTHv3UDvH8OR4zA33GCYFbu/rq37df+MuqXtmL5f3T7cL9achDeEVhxvPv3J55Iv5VlrhfIGmmvo4zOcnAdE9vI+Hd1zPd2bTTmkM+T54uYfgUJfMBqRJ0Mwq5LkVD3Mw93cvu0NzRUmoFUvKFZlJMbk1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mit.edu; dkim=pass (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=n0sXTzpi; dkim-atps=neutral; spf=pass (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=lists.ozlabs.org) smtp.mailfrom=mit.edu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=n0sXTzpi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=lists.ozlabs.org)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjTvW2ZHbz2xjh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 00:39:02 +1100 (AEDT)
Received: from macsyma.thunk.org (guestnat-104-133-0-100.corp.google.com [104.133.0.100] (may be forged))
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 4A5Dccb4012098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 08:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1730813921; bh=KYeCLSsUZRIrmEOMwxGqSfD7V2RsNkns3qvfU6C43UA=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=n0sXTzpicMGl6JI0ADkVc/HiKPojEgkGYyO1pQx2dzcrnqvXsM2RZzo+Sb5svGPgc
	 qW0SX7zl5zqRkKltYfBmUgFXDCqUkRisSud/xR5J6Tbouah7IfPO5+X+s+0mFZ/id0
	 KJJ0kAX4lfNE8lrvU3EBvRFI9YhbvsP4WOsZDJiCLfWkjotYwy29Ajn/HIKkTf9yE5
	 NEeFKTWS8cZ06m1TRDAbI0VH51oFtGnGm3lMEoaaiG94ccor1fss0Fcwy+3maWrH6L
	 KfqzubfM08EeL0DYjOq/Yn2j7aagvnHNL3UgvZEC8cQqhZOWSOz17Mgc3iRw2QINym
	 fJUtJFR76A04Q==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 7ED14340E22; Sat, 02 Nov 2024 15:26:35 -0700 (PDT)
Date: Sat, 2 Nov 2024 15:26:35 -0700
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 15/18] ext4: switch to using the crc32c library
Message-ID: <20241102222635.GB455688@mit.edu>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-16-ebiggers@kernel.org>
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
In-Reply-To: <20241025191454.72616-16-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 12:14:51PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Theodore Ts'o <tytso@mit.edu>


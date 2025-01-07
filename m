Return-Path: <linuxppc-dev+bounces-4769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC90A03EF4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:17:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS96h0QZfz30hY;
	Tue,  7 Jan 2025 23:17:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ba"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736252267;
	cv=none; b=fsq8O25atViHFPAw++moxWLRX4wBWcQDnPzxhTQgJg67eoJXVSi5NszPiJgDJvdIcb6gT6vKamFaMGJliSYbkErBThIbNhKNlmfzxtEgYl2HsDtbVf/uZJFnrEbXsxFnxFhdSVZQMxcteUzEP8naK9pnD7Sj7omoYqDRb1/2f2xzyX0FPdFRJJ6l2468TQWRvXN0MJFeJnXqPuHVgybhpdqm89akuZHxi5lEeNuFTbGEMyRF4f+cjecyWoEkKy5iGi8D9rHN4MxGAJuPvnMyXOvS6jUDCjbrAK5mFKKNdca7zlJdcxhrBpXkMOHTFuNmeeT4Qkcu2y7zxIhJfzUO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736252267; c=relaxed/relaxed;
	bh=d9nLKw/TBKhv6igKvwiN3bHxEHFcUwZGkyor1G6qVPQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HmZUD4G0aKiEBFB4UEHl600444RO6HMBTcn/meg5T7OQHt+2UpYyb5pRrYbTyCHSt2AlHOUXhkJh9+TfvWjz9vZpg8W8gWvBpAM214KD+lAbl1iqDd+TPBX+tAQwnwnXlmi8M8S57RjyQRvtA5chJ2ZNrl5XDCuzFCVVFZczHAXlCrpZXcfLb1aarL6VsbmHwNkNTqvH2bzIu4dSjUAGA8pUss5AbnDgEEBaSafjRW3vllp/CbDXqxbszXeeS7ffTl5D+Da/yOeCMenGrTJRh4ZJpt8ZC9euwOxQC6IRTKP3aMr/H/xuodDiey8RXZ5v2POCgISOIHFURwGS8RlI5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::ba; helo=out-186.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ba; helo=out-186.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [IPv6:2001:41d0:203:375::ba])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS96V4C71z30hG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:17:35 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736252228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9nLKw/TBKhv6igKvwiN3bHxEHFcUwZGkyor1G6qVPQ=;
	b=YDXTTLX5n+bg56cnV6XC6B3Qy+MwlzuWxdI0TDZbEEps9qJYCi0/RQJManwVaIEsNEv0qL
	yaoLipH1tJQJmzYOKJSzDHBMcuuTWbv4GTkuYy8FtZ5C8sVBtV0lrBhBaZ3j5XKaiCJClP
	AlrDosNRlS8miATbYh9YsPDRTLyMcsE=
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
Date: Tue, 7 Jan 2025 13:16:54 +0100
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
 <87v7weodqn.fsf@mpe.ellerman.id.au>
 <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 23. Nov 2024, at 11:19, Christophe Leroy wrote:
> Isn't our file just a copy of the one from binutils ? Shouldn't we =
adjust it based on commit =
https://github.com/bminor/binutils-gdb/commit/2ce18a16268a ?

It looks like it's a copy and the name is spelled the same as in my =
patch:

  "Mimi Phuong-Thao Vo"

What's missing to get this merged?

Thanks,
Thorsten=


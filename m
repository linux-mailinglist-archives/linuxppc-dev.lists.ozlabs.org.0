Return-Path: <linuxppc-dev+bounces-3384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBE29D03B4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjG5J4sz3brH;
	Sun, 17 Nov 2024 23:25:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846338;
	cv=none; b=REPcVnVcdoOArBkZ1jg0mrq0+EuxkddUabB0mE5AdLfw2bLWMEnF8kAF47nwf1zZemgfWBLATK9ZiwyeBt2ml7GoZQ4huCTe3Q3CVhp5Y1aqoU6Z3IPH2pad5QbGVZtWpxmpkG8PTkZ79fnsw7SGQ4ahT4mUYOS6K/pq23fM7eQ9tfpNrjikAKlr80RKc6nP31A1CEdiRDNPpWL+gCaHsr/wt//9op4jX6pYw9DBbCwuhxUKUiPoQnLTWO3knDdT1OOH3GX4IjhrtRvcHPoXN0nu4qdfL8Bad+KEVQeXPINu/Dxyt5L4oUGqHxX+RpNEAI/bIiFaYJoUy4bzsLFo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846338; c=relaxed/relaxed;
	bh=BPCvHt5zy1SV5b+ejHZjDE498sS62YWrSVug9774VSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SuMiHgfxrDsc4tSKbSCDwfBx/QsNG7aSYqo8RRkRz8TH6nqha2J+l0Rhyle3M9atKU5EEtDS2jLnNtzE+eld8mBZb6yYOnvJ5nXw6YKVIEVXVNFSxUWfau9kf4x1qHMxXcBDRnsIBnHmZHCAsnNu5GWKQ+SJYuR61VsMo2nvbFyWH9KObZIrGbbjrv5Y9e4o711rWP3H4UxRJgLpMELn/6g66+N0gFAoEmNpxIN5c1RyEL8d5rR10T2XAqhgFcDLbkExaukCilJ33D9JxXiazPZp9y+YLdr/PmgrhXUNoU0RsiNgHcQbj8rMjPe2LTp1h5CmHS6P1SbkIGS+0NcAbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TfOshlQq; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TfOshlQq;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjD3RGVz3bpL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846333;
	bh=BPCvHt5zy1SV5b+ejHZjDE498sS62YWrSVug9774VSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TfOshlQqU9L6ENwIq1azGYyCZD0tb1Tu6LCXV4AXOQRzTa8ZY4NBwMU27RvkczcJQ
	 rKbQnWC7wAMfGYuNuczp20EykRPkQGdnIgHfv+W8NyUpABrrzo9A2NpYQuR6+uiyO1
	 5uKBRXqZoM1xYSeyKQFSqg7GWHD5jgWWoBuiASGflCz1C2SuVdUU8P/H8FZuN+3WaC
	 0/YQ3NlDH7IerRfTax+frJYsPCvS+DudC5xfVlR2c4U4xMb0qZsbtczzlcy+oW+HiO
	 9o4M/ihLJgLSh4JT4hERUGdcQ9L2Oj0CMtwTl0DfVvzWof1LWcFSOg+i1R6gRlhdnA
	 TioyKzUNDjfZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj93Q4Sz4xfG;
	Sun, 17 Nov 2024 23:25:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241106212647.341857-1-robh@kernel.org>
References: <20241106212647.341857-1-robh@kernel.org>
Subject: Re: [PATCH] powerpc: cell: Use for_each_of_range() iterator
Message-Id: <173184539750.890800.15564743052815788450.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 06 Nov 2024 15:26:46 -0600, Rob Herring (Arm) wrote:
> Simplify the cell_iommu_get_fixed_address() dma-ranges parsing to use the
> for_each_of_range() iterator.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: cell: Use for_each_of_range() iterator
      https://git.kernel.org/powerpc/c/f3ef7dbda9b589cdad833001e4366eb80977b7f1

cheers


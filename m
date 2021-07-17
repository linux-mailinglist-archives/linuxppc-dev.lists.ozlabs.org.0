Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A116B3CC6AC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 00:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GS2zf4HZwz3bX9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 08:37:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qWYhr5Pp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=qWYhr5Pp; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GS2zB0GHHz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 08:36:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=jw5jegpVzEx6W0IuTDo8ewoGY57Mg8QE/qYuKyKZD9Q=; b=qWYhr5PpjrrtUpue4cdgCyppBy
 q7XrI+YaB8tvOCE5sKh/b3xoRihID/lBJRw4tfMwh3YC6NJVTPDo8nsUxcIYzeney109qu5dXgWtN
 RzX/Wjh63aPdu33oAsYnUDYCaBnVLyuGNi+Qe0TADvQN+gJPc375dqh3694+bNrLsJCW9Xv2yilVf
 V0aAwWDXauxvJNhgX2TNFeNFM6CxPnVmE+bxnGiuvICl04n0OhSHDeY+ufwk3ZxqG8L1IzEE7w6Y1
 eGwWbVp/DeTbTks2hUlklndb0zFvWJGSYCp0Y4caVteekwb8Zg8AWX06zJRPeDE0wTBg6jOO5yXlR
 OX+nqMag==;
Received: from [2602:306:c5a2:a380:20fe:9687:9f1f:1f76]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4sv9-000jV5-IN; Sat, 17 Jul 2021 22:36:31 +0000
From: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH v3 1/2] net/ps3_gelic: Add gelic_descr structures
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1625976141.git.geoff@infradead.org>
 <e63dc0564b7c6e4f699c306bf36feb4bd9c30f26.1625976141.git.geoff@infradead.org>
 <20210711160330.Horde.YmbaUrNaGLYM4ADZvVr_gA1@messagerie.c-s.fr>
Message-ID: <c0a78c3f-0934-bc29-147d-0b3e14efb70b@infradead.org>
Date: Sat, 17 Jul 2021 15:36:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210711160330.Horde.YmbaUrNaGLYM4ADZvVr_gA1@messagerie.c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 7/11/21 7:03 AM, Christophe Leroy wrote:
> 
> Your patch has a lot of cosmetic changes. Several of them are just wrong. The other ones belong to another patch. This patch should focus only on the changes it targets.
> 
> Your patch is way too big and addresses several different topics. Should be split in several patches.
> 
> I suggest you run checkpatch.pl --strict on your patch
> 

Thanks for the review.  I'll create a follow up patch set with
your comments in mind.

-Geoff

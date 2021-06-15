Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 448823A77D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G406Z6yf3z303J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:18:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H9Rn/WzG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=H9Rn/WzG; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G40683ZXPz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:18:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G40653jP4z9sRK;
 Tue, 15 Jun 2021 17:18:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623741503;
 bh=PCjfL32gackDGGhjAkNyZ/DL6oMl+o8NKneVCsc9Szg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=H9Rn/WzGnluUtjcD4uSOsgVxG5L2reh9ymNdmNEBhQrT68Ie8SLd0LzUVOalYh2bH
 UlYm+iokrvjQ3nkBM6JAfWR4kslk0683JjsivYK4JlfzBkbgBraxUan7VCA0mXDKKw
 OXnv/acYi9KIw1RnMyQExJ329XkUUqhADqTzEF/ZL4q+VKJR6H5s3rS/KVurJsMDGi
 zC54DYBYWLL22h5yE+IyJP9QNKadC9ZVE6UX7tnf0CLsoeI099Oro9e0idzXknMsUG
 2I64WdzP5b8bPRGdBrl2ABFojf+Y3eU6LCV7qAHtwLFWgmeGGYeoSvBqIPd3kGudao
 2p8d7yZjjcpIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Subject: Re: [PATCH v2 00/12] powerpc: Cleanup use of 'struct ppc_inst'
In-Reply-To: <cover.1621516826.git.christophe.leroy@csgroup.eu>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
Date: Tue, 15 Jun 2021 17:18:17 +1000
Message-ID: <87r1h3tx3a.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> This series is a cleanup of the use of 'struct ppc_inst'.
>
> A confusion is made between internal representation of powerpc
> instructions with 'struct ppc_inst' and in-memory code which is
> and will always be an array of 'unsigned int'.

Why don't we use u32 *, to make it even more explicit what the expected
size is?

cheers

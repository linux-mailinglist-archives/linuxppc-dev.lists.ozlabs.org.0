Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E534F60F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97hT13W6z3g4X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:17:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xc2JPjz3c7q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xb26s4z9sWP; Wed, 31 Mar 2021 12:10:23 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: gregkh@linuxfoundation.org, fbarrat@linux.ibm.com, arnd@arndb.de,
 ajd@linux.ibm.com, Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20210310174405.51044-1-ldufour@linux.ibm.com>
References: <20210310174405.51044-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH] cxl: don't manipulate the mm.mm_users field directly
Message-Id: <161715297019.226945.4500799127424127385.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:30 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: clombard@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Mar 2021 18:44:05 +0100, Laurent Dufour wrote:
> It is better to rely on the API provided by the MM layer instead of
> directly manipulating the mm_users field.

Applied to powerpc/next.

[1/1] cxl: don't manipulate the mm.mm_users field directly
      https://git.kernel.org/powerpc/c/2d9f69bc5a5a75579b410beb0dc3d313be762c9f

cheers

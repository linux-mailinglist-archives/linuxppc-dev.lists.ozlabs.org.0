Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 002B34B62E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:35:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVDr4QkYz3fk4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:35:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6K1CZCz3cXn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6H584Hz4y4k;
 Tue, 15 Feb 2022 16:30:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20191127220959.6208-1-msuchanek@suse.de>
References: <20191127220959.6208-1-msuchanek@suse.de>
Subject: Re: [PATCH] powerpc: add link stack flush mitigation status in
 debugfs.
Message-Id: <164490278798.270256.16110004295651186693.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:27 +1100
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Anthony Steinhauser <asteinhauser@google.com>,
 "Gustavo L. F. Walbon" <gwalbon@linux.ibm.com>,
 "Christopher M. Riedl" <cmr@informatik.wtf>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Diana Craciun <diana.craciun@nxp.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Nov 2019 23:09:59 +0100, Michal Suchanek wrote:
> The link stack flush status is not visible in debugfs. It can be enabled
> even when count cache flush is disabled. Add separate file for its
> status.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: add link stack flush mitigation status in debugfs.
      https://git.kernel.org/powerpc/c/b2a6f6043577e09d51a4b5577fff9fc9f5b14b1c

cheers

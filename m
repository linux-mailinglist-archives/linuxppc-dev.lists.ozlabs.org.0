Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773934F62D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:22:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97pz1qZXz3hbs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:22:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Y01nZcz3cMH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xw5YgKz9svs; Wed, 31 Mar 2021 12:10:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 mpe@ellerman.id.au, jniethe5@gmail.com, benh@kernel.crashing.org,
 alistair@popple.id.au, linux-kernel@vger.kernel.org, paulus@samba.org
In-Reply-To: <20210317090413.120891-1-unixbhaskar@gmail.com>
References: <20210317090413.120891-1-unixbhaskar@gmail.com>
Subject: Re: [PATCH] powerpc: kernel: Trivial typo fix in the file kgdb.c
Message-Id: <161715297909.226945.16053131712102580026.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:39 +1100
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
Cc: rdunlap@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Mar 2021 14:34:13 +0530, Bhaskar Chowdhury wrote:
> s/procesing/processing/

Applied to powerpc/next.

[1/1] powerpc: kernel: Trivial typo fix in the file kgdb.c
      https://git.kernel.org/powerpc/c/89f7d2927ae16ea470d29234447763826e40c6cf

cheers

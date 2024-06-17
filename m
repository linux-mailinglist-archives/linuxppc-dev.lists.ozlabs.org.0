Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC4290B60A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 18:16:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2w4f3zybz3g9Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 02:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2w4D2cLJz3ftF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 02:16:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 45HGDc5W028348;
	Mon, 17 Jun 2024 11:13:38 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 45HGDb8V028342;
	Mon, 17 Jun 2024 11:13:37 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 17 Jun 2024 11:13:36 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: Re: [PATCH] powerpc: Fixed duplicate copying in the early boot.
Message-ID: <20240617161336.GM19790@gate.crashing.org>
References: <20240617023509.5674-1-jinglin.wen@shingroup.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617023509.5674-1-jinglin.wen@shingroup.cn>
User-Agent: Mutt/1.4.2.3i
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
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Jun 17, 2024 at 10:35:09AM +0800, Jinglin Wen wrote:
> +	cmplwi	cr0,r4,0	/* runtime base addr is zero */

Just write
   cmpwi r4,0

cr0 is the default, also implicit in many other instructions, please
don't clutter the source code.  All the extra stuff makes you miss the
things that do matter!

The "l" is unnecessary, you only care about equality here after all.

Should it not be cmpdi here, though?


Segher

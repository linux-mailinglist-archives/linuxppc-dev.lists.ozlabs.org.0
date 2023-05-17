Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D038706115
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 09:27:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLl7F10ZPz3f5w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 17:27:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vMZQ+S21;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vMZQ+S21;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLl6L3LnVz3bh0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 17:26:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0DEC63982;
	Wed, 17 May 2023 07:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76501C433EF;
	Wed, 17 May 2023 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684308407;
	bh=aqNY6qE18SxSweL7OgAJaona5RImY/HQUlycRg3Pwe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vMZQ+S21a02s+M0+475Ybj94bAl+EIGza5yKMZf1nxPw75qt0KPUnmwy32MhLXjOO
	 V30S95rczEQLaBoZDxVn/hN1+MNhAjIV4s/mH5g9N4m17iN2dXcNeoH8dluj4HPhq3
	 leJQYN5nvozfCzfVoG+EDYN4tjV5ELAPjEbKuZi4/2UmQCF7eGXqSMiIZJ5/bHRXcK
	 0FxmH9rmGPKypK7dzmuXto7Dx61Sb9I3Uhxej/lC0IeCyemSz5NBlKXAju6KY5AIkR
	 9tuUH+lXJHnR/dHviAnkn+xU8iPSnvL8+NaPSmpf3Km1xEzYaegxX7ZGU1hm4FxO0F
	 JopB3QI89srjQ==
From: Christian Brauner <brauner@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] procfs: consolidate arch_report_meminfo declaration
Date: Wed, 17 May 2023 09:26:21 +0200
Message-Id: <20230517-bargeld-achthundert-0d56603bda7f@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516195834.551901-1-arnd@kernel.org>
References: <20230516195834.551901-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=brauner@kernel.org; h=from:subject:message-id; bh=aqNY6qE18SxSweL7OgAJaona5RImY/HQUlycRg3Pwe8=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSkNNa1vbRzrT/o77xHepL944QPMhKS2t2+9xZpWcxdIxl1 83FWRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwET8nzH8lW9/nrtIm21nErejtfePeu GUac5Gq8/q24nk/N5yNr/6MyPDpacPY5c0ByfOf3wutTx4atH5rp+t6y2kIyf96L7cFLueDQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, viro@zeniv.linux.org.uk, Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <brauner@kernel.org>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 May 2023 21:57:29 +0200, Arnd Bergmann wrote:
> The arch_report_meminfo() function is provided by four architectures,
> with a __weak fallback in procfs itself. On architectures that don't
> have a custom version, the __weak version causes a warning because
> of the missing prototype.
> 
> Remove the architecture specific prototypes and instead add one
> in linux/proc_fs.h.
> 
> [...]

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] procfs: consolidate arch_report_meminfo declaration
      https://git.kernel.org/vfs/vfs/c/edb0469aa6e8

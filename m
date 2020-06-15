Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB11F9925
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 15:41:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lstV47JDzDqHp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:41:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+982856cf37d7c265414a+6140+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=DgNA8zNj; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrzX5CtxzDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 23:00:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=KEBwjnYUxfYhJTwez4F4fZnZA29JFLpBE55ailzCXvU=; b=DgNA8zNjg31fURBe4MXNxzAOhB
 NK3HSZHgIza8gTjAdkipWM3Ym6khB8DZ1Ua2lKEqsk4tChR51Rv6Nj5tQjHuqiwguPR1MTqqOvvVn
 ATtNL2LZr+Fd8c2w/Zj7gjJH5p4xd42seDJ5bXqk5d2VCQMt91YWdE22Y+ATPBXjMmnbBTqWS0Dd0
 WC9a5c+5d0BUckpT8EBBuMnD6ZAGG8RnlfP6N+x8oECvP3pxtIr9pT9jH+TUIZfKlbL5tKsxJA+6t
 4OnNPShuVQndS1ghp/bJMSINGJuiWu3E2lGr+9nhQG8ntYFYHPcdmIj4F16cvC9IPe1XdgSVWewgZ
 aNIELFwg==;
Received: from 195-192-102-148.dyn.cablelink.at ([195.192.102.148]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkoj4-0007nP-Cw; Mon, 15 Jun 2020 13:00:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: properly support exec and wait with kernel pointers
Date: Mon, 15 Jun 2020 15:00:26 +0200
Message-Id: <20200615130032.931285-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series first cleans up the exec code and then adds proper
kernel_execveat and kernel_wait callers instead of relying on the fact
that the early init code and kernel threads implicitly run with
the address limit set to KERNEL_DS.

Note that the cleanup removes the compat execve(at) handlers (almost)
entirely, as we can handle the compat difference very nicely in a
unified codebase.  The only exception is x86 where this would list the
handlers twice in the same syscall table due to the messed up x32
design.  I had to add an extra compat handler just for that case, but
maybe someone has a better idea.

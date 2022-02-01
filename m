Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54B4A57FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 08:43:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnxkK1rQMz3cQc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 18:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnxjv0qfXz2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 18:42:59 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 81C9A68AA6; Tue,  1 Feb 2022 08:42:54 +0100 (CET)
Date: Tue, 1 Feb 2022 08:42:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 1/5] uapi: remove the unused HAVE_ARCH_STRUCT_FLOCK64
 define
Message-ID: <20220201074254.GB29119@lst.de>
References: <20220131064933.3780271-1-hch@lst.de>
 <20220131064933.3780271-2-hch@lst.de>
 <CAJF2gTTjj8DXByP44DsC47xB2W_88j5Qp7TyEnRQCfUvHQUixA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJF2gTTjj8DXByP44DsC47xB2W_88j5Qp7TyEnRQCfUvHQUixA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 01, 2022 at 09:16:27AM +0800, Guo Ren wrote:
> Right?
> 
> Seems you've based on an old tree, right?

This was a fairly recent Linus tree.  I don't have the tree at hand
right now due to travel, but what changed there recently?

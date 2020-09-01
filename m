Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCB259D2F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 19:28:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgvDk5ZR8zDqRn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 03:28:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2002:c35c:fd02::1;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgv942cSnzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 03:25:27 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kDA1w-008nxM-Ez; Tue, 01 Sep 2020 17:25:12 +0000
Date: Tue, 1 Sep 2020 18:25:12 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc v2
Message-ID: <20200901172512.GI1236603@ZenIV.linux.org.uk>
References: <20200827150030.282762-1-hch@lst.de>
 <a8bb0319-0928-4687-9e9c-777c5860dbdd@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8bb0319-0928-4687-9e9c-777c5860dbdd@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 01, 2020 at 07:13:00PM +0200, Christophe Leroy wrote:

>     10.92%  dd       [kernel.kallsyms]  [k] iov_iter_zero

Interesting...  Could you get an instruction-level profile inside iov_iter_zero(),
along with the disassembly of that sucker?

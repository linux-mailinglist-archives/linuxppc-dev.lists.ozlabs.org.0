Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D88C1AF8A3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 10:14:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494jK16xgFzDrBv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 18:13:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494j5C5YqKzDrPT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 18:03:43 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id ABB1568BEB; Sun, 19 Apr 2020 10:03:39 +0200 (CEST)
Date: Sun, 19 Apr 2020 10:03:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 2/8] signal: clean up __copy_siginfo_to_user32
Message-ID: <20200419080339.GC12222@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-3-hch@lst.de> <87pnc5akhk.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnc5akhk.fsf@x220.int.ebiederm.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 17, 2020 at 04:08:23PM -0500, Eric W. Biederman wrote:
> This bothers me because it makes all architectures pay for the sins of
> x32.  Further it starts burying the details of the what is happening in
> architecture specific helpers.  Hiding the fact that there is only
> one niche architecture that does anything weird.
> 
> I am very sensitive to hiding away signal handling details right now
> because way to much of the signal handling code got hidden in
> architecture specific files and was quite buggy because as a result.

I much prefer the unconditional flags over the crazy ifdef mess in
the current coe and your version.  Except for that and the rather
strange and confusing copy_siginfo_to_external32 name it pretty much
looks the same.

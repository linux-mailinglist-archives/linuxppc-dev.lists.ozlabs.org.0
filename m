Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D51422588CA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 09:10:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgdWX63CQzDqQW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 17:10:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgdTY0hzzzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 17:08:47 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3B84668B05; Tue,  1 Sep 2020 09:08:42 +0200 (CEST)
Date: Tue, 1 Sep 2020 09:08:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <rong.a.chen@intel.com>
Subject: Re: [fs] ef30fb3c60: kernel write not supported for file
 /sys/kernel/softlockup_panic
Message-ID: <20200901070841.GA29847@lst.de>
References: <20200827150030.282762-2-hch@lst.de>
 <20200901064849.GI4299@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901064849.GI4299@shao2-debian>
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
Cc: linux-arch@vger.kernel.org, yu.c.chen@intel.com,
 Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, lkp@lists.01.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 rui.zhang@intel.com, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 0day robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks like since the start of this series we've grown new code to
use kernel_write on sysctl files based on boot parameters.  The good
news is that this just means I need to resurrect the sysctl series
as all that work was done already.

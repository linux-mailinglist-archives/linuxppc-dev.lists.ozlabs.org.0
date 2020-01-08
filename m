Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60650134007
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 12:14:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t67w4sZFzDqST
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 22:14:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t65f6HfTzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 22:12:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47t65d74X3z8t70
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 22:12:05 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47t65d5x1Pz9sRp; Wed,  8 Jan 2020 22:12:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47t65d26KCz9sRl
 for <linuxppc-dev@ozlabs.org>; Wed,  8 Jan 2020 22:12:04 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2E56EAC9A;
 Wed,  8 Jan 2020 11:12:00 +0000 (UTC)
Date: Wed, 8 Jan 2020 12:11:58 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v6 3/6] powerpc/fadump: reorganize /sys/kernel/fadump_*
 sysfs files
Message-ID: <20200108111158.GY4113@kitsune.suse.cz>
References: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
 <20191211160910.21656-4-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211160910.21656-4-sourabhjain@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-doc@vger.kernel.org, mahesh@linux.vnet.ibm.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
 gregkh@linuxfoundation.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 09:39:07PM +0530, Sourabh Jain wrote:
> As the number of FADump sysfs files increases it is hard to manage all of
> them inside /sys/kernel directory. It's better to have all the FADump
> related sysfs files in a dedicated directory /sys/kernel/fadump. But in
> order to maintain backward compatibility a symlink has been added for every
> sysfs that has moved to new location.

Patched this series into my test kernel and the sysfs sfiles look OK.

Tested-by: Michal Suchanek <msuchanek@suse.de>

Thanks

Michal

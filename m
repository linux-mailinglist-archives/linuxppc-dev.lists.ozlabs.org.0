Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D661A2723
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 18:27:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y8nN3VFKzDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 02:27:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=dsterba@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y80c1g5wzDr3V
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 01:51:59 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9CC7AF6E;
 Wed,  8 Apr 2020 15:51:51 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 0B140DA730; Wed,  8 Apr 2020 17:51:10 +0200 (CEST)
Date: Wed, 8 Apr 2020 17:51:10 +0200
From: David Sterba <dsterba@suse.cz>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 05/35] docs: filesystems: fix renamed references
Message-ID: <20200408155110.GW5920@suse.cz>
Mail-Followup-To: dsterba@suse.cz,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Harry Wei <harryxiyou@gmail.com>,
 Alex Shi <alex.shi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>,
 David Howells <dhowells@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Anton Altaparmakov <anton@tuxera.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-afs@lists.infradead.org,
 ecryptfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com
References: <cover.1586359676.git.mchehab+huawei@kernel.org>
 <bcfddf36f60d928c78473af4e6a0b29904213c44.1586359676.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcfddf36f60d928c78473af4e6a0b29904213c44.1586359676.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: Jan Kara <jack@suse.cz>, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel@lists.freedesktop.org, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Harry Wei <harryxiyou@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Alex Shi <alex.shi@linux.alibaba.com>, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Mark Fasheh <mark@fasheh.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Tyler Hicks <code@tyhicks.com>,
 Christoph Hellwig <hch@infradead.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Alexey Dobriyan <adobriyan@gmail.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, ecryptfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 05:45:57PM +0200, Mauro Carvalho Chehab wrote:
> Some filesystem references got broken by a previous patch
> series I submitted. Address those.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

For

>  fs/affs/Kconfig                                             | 2 +-

Acked-by: David Sterba <dsterba@suse.com>

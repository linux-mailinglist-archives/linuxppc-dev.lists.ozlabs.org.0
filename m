Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA0186721
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 09:56:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gqt85Vh9zDqLf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 19:56:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gqqY2DF2zDqJH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 19:54:31 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id z13so606446wml.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 01:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oYVrvr0SPfoysj/NNmvUSSHpDs57n+aIQag0hdxed9Q=;
 b=RVHahidSsXDvIW+HauYDPldESW+oTK2EfJMwN9hQP76i+/fJ3+ovc94WsAb8NHWH2G
 8ntJYg1UIeEUYtGE5IB8OOAYPcBtnYTBB0cBmEpS/ZjC67dpJEfcNE7IHkxswQaAJUvm
 Tcr/WpJKZbFKdNVyWiPJFEz/TchCBHSz7DKTPUACjfFSByvdyQGUjEZDDWnzgntHhLtc
 inlNpMkJkljM0lKxBbEEG/0cmLSE9SguCgZxHtKYcDidIuaR6gCt9iuwAw6sjIuwL7e2
 wdH5GhLYcQAL5ziFwE8T0beqotZnjIzBjvQg8DfrwLyLcX+LER71avucnbLf9Q83pZop
 933A==
X-Gm-Message-State: ANhLgQ3ss4/60Rwb2+jltUMV/HgjrfL6Uu13Jbo3HkPmdEhxqXbVeMHm
 TQKM9wrPIo/uOc7E5IXsFZM=
X-Google-Smtp-Source: ADFU+vtmZUZuH5KSxW2MgIvH0EKbLpsX37ml/XOZS0AIAJE35PQu3muHqSe7FqIS923IhbPKrfZNlQ==
X-Received: by 2002:a7b:c92a:: with SMTP id h10mr26017913wml.26.1584348868140; 
 Mon, 16 Mar 2020 01:54:28 -0700 (PDT)
Received: from localhost (ip-37-188-254-25.eurotel.cz. [37.188.254.25])
 by smtp.gmail.com with ESMTPSA id o3sm31430395wme.36.2020.03.16.01.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 01:54:27 -0700 (PDT)
Date: Mon, 16 Mar 2020 09:54:25 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH 3/3] mm/page_alloc: Keep memoryless cpuless node 0 offline
Message-ID: <20200316085425.GB11482@dhcp22.suse.cz>
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-4-srikar@linux.vnet.ibm.com>
 <alpine.DEB.2.21.2003151416230.14449@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003151416230.14449@www.lameter.com>
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun 15-03-20 14:20:05, Cristopher Lameter wrote:
> On Wed, 11 Mar 2020, Srikar Dronamraju wrote:
> 
> > Currently Linux kernel with CONFIG_NUMA on a system with multiple
> > possible nodes, marks node 0 as online at boot.  However in practice,
> > there are systems which have node 0 as memoryless and cpuless.
> 
> Would it not be better and simpler to require that node 0 always has
> memory (and processors)? A  mininum operational set?

I do not think you can simply ignore the reality. I cannot say that I am
a fan of memoryless/cpuless numa configurations but they are a sad
reality of different LPAR configurations. We have to deal with them.
Besides that I do not really see any strong technical arguments to lack
a support for those crippled configurations. We do have zonelists that
allow to do reasonable decisions on memoryless nodes. So no, I do not
think that this is a viable approach.

> We can dynamically number the nodes right? So just make sure that the
> firmware properly creates memory on node 0?

Are you suggesting that the OS would renumber NUMA nodes coming
from FW just to satisfy node 0 existence? If yes then I believe this is
really a bad idea because it would make HW/LPAR configuration matching
to the resulting memory layout really hard to follow.

-- 
Michal Hocko
SUSE Labs

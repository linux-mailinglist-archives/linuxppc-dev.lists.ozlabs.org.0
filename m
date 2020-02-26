Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D74C170856
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 20:03:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SQFD2B4nzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 06:03:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SQCW1NlNzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 06:02:14 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id p17so460661wma.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 11:02:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wma8//MuEJ5lDMCNv7woFeX6q3iIbYqlguJq6Z39y9g=;
 b=clUwar4Da9E+wMKc+HjVjwzw39X/kaLkyA9fZUGix8DwcItQpOhgGlGySIqtCtpyk4
 pazF2pRYT50hDHB6P9sNagFScAqPR0f9OFyOJJGbs/QWaxTM4SsKk+6ziLmP1yY2AmqT
 6dadfPa+/hAu5+hsBVbDyF/wbdywktiEDj1kZPmmeQUxwZ3k7pkdfQLq4VTjPYA74O4D
 OqXlPABHEuiCGq0nOrQJX4z20ailqeq7ENxJg4Vy48sl7kVeJL6mSTM309tvkzSfaUvX
 anlESLW6DV01cY8TJDZawWOAmOPzq1GF9LDbLdbB/cjZPdEbUUiv0SmiplZgfkjmkRhO
 l45w==
X-Gm-Message-State: APjAAAX2MbvMcc/H78Hhw3jGI8Z4onW3hMIAnI3JbX3UU31eq+OFBw4p
 eQmV7hfr6arT2f7PFK74SgY=
X-Google-Smtp-Source: APXvYqy1WHHW7PhNyQZfNF9Uby7MTmMW2VacmOxQznSOX8L9F7K9RTZt3mm2UBxnU4ncOA9Q4kOakw==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr288531wme.23.1582743731757;
 Wed, 26 Feb 2020 11:02:11 -0800 (PST)
Received: from localhost (ip-37-188-190-100.eurotel.cz. [37.188.190.100])
 by smtp.gmail.com with ESMTPSA id t133sm4060446wmf.31.2020.02.26.11.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 11:01:56 -0800 (PST)
Date: Wed, 26 Feb 2020 20:01:47 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Christopher Lameter <cl@linux.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200226190147.GR3771@dhcp22.suse.cz>
References: <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261843200.8915@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002261843200.8915@www.lameter.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Pekka Enberg <penberg@kernel.org>,
 Kirill Tkhai <ktkhai@virtuozzo.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 26-02-20 18:44:13, Cristopher Lameter wrote:
> On Wed, 26 Feb 2020, Michal Hocko wrote:
> 
> > Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
> > semantic right? At least I do not see anything like that documented
> > anywhere.
> 
> Kmalloc_node does not support memory policies etc. Only kmalloc does.
> kmalloc_node is mostly used by subsystems that have determined the active
> nodes and want a targeted allocation on those nodes.
 
I am sorry but I have hard time to follow your responses here. They open
more questions than they answer for me. The primary point here is that
kmalloc_node on a memory less node blows up and panics the kernel. I
strongly believe this is a bug. We cannot really make all callers of
kmalloc_node and co. to be hotplug aware.

Another question is the semantic of kmalloc_node when the node cannot
satisfy the request. I have always thought that the allocation would
simply fall back to any other node unless __GFP_THISNODE is explicitly
specified.

-- 
Michal Hocko
SUSE Labs

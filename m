Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF183DDE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 16:45:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AAPetc1G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM28q21c5z3dTH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 02:45:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AAPetc1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM27S0Yyrz3cXP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 02:44:35 +1100 (AEDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-206689895bfso328274fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 07:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1706283869; x=1706888669; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifj3vKt8QC0k+Lvrl/eE4vaSsPq+S4SksoQKXsBRSXc=;
        b=AAPetc1GAC9XSjJZKHobGSQKkBYEKoe1dedT3WSNipzVEb7zofeo3xqpIgz7BEiDOY
         i5wz2d0lW76880x6ugp6mtSVV/nXmdkEnkvK6YmUCGxDSBJ627S6NthW3Z2UaCL98hDR
         xSRjs4PXqczMAEvUOoLCRNSrV2bb5O/xejUxDsuNyN86jSRaa6B9ApjCnZ5kFCY3KgYt
         p0uFz1G3+YziJZSZrlVTh+89wGXgoXjdX4VrviTQiW/lIPDfznsoD7CD0Eo6T2fIIA1z
         H6ztnvXv4QV/igezUjMreucBmSK6XEXRDg/eVkksnnNEGxlroxx5HMbHX+aNPzbF4Vch
         BFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283869; x=1706888669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifj3vKt8QC0k+Lvrl/eE4vaSsPq+S4SksoQKXsBRSXc=;
        b=C1w4olEMYG8O1lcOaSBPxHG+hmNApokqOVXQFCCxJqxG5B1nUk870OsaKwPXxMCBlm
         DoE+yZmGfwOCLoRvhew4pCB2sdMmW1LraYd/ApaZOAJraYxkSgzNBlZwJI35QmcpyOl8
         /wdWwy4Nvv6YmecMzIkQYewYf6odiWUsSx/w7mc1IU6LsFAw5AgH99iCWv+XvZ6lAAlB
         F5XJT7wN12cMJz9YD0xPjJDgraSRQYyq87zqp76iD/TyqQLST4oSIwZwcMPZvejeXZ28
         0nhoaP1kUHnhyi0A5mpTS/JLojzqRC89lMitjiUzcKEkYIT9pG3zMEidQTMd7ln9qpxS
         720w==
X-Gm-Message-State: AOJu0Yxbqlrzr1fLI54tOJm88P2jojHgw6bjr+/+n5yfT6KPCrUCqgy7
	xvL1OD0rrRKpFheit26DzNyeFBMb2qxtY5NKPUnCrzk+5rC+qID59F3TT/IISfc=
X-Google-Smtp-Source: AGHT+IHvXs9zt8rzQimULCxVKWRw2gBSkFT+WcT7r0xChxJT011B7UN6s63xs55ItZMqKHL08VvUaA==
X-Received: by 2002:a05:6871:2787:b0:214:2544:bfd9 with SMTP id zd7-20020a056871278700b002142544bfd9mr955769oab.43.1706283869008;
        Fri, 26 Jan 2024 07:44:29 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id pl10-20020a0568704e0a00b0021837cadf53sm200549oab.39.2024.01.26.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 07:44:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rTONX-009SCu-NX;
	Fri, 26 Jan 2024 11:44:27 -0400
Date: Fri, 26 Jan 2024 11:44:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 1/2] powerpc: iommu: Bring back table group
 release_ownership() call
Message-ID: <20240126154427.GB50608@ziepe.ca>
References: <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <20240125155017.GW50608@ziepe.ca>
 <b825dd04-3d32-4fbd-91e3-523ddf96fc7a@linux.ibm.com>
 <20240126151701.GZ50608@ziepe.ca>
 <392247278.10124607.1706282995795.JavaMail.zimbra@raptorengineeringinc.com>
 <20240126153806.GA50608@ziepe.ca>
 <1453449220.10126352.1706283596477.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453449220.10126352.1706283596477.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: jroedel <jroedel@suse.de>, gbatra <gbatra@linux.vnet.ibm.com>, Shivaprasad G Bhat <sbhat@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, npiggin <npiggin@gmail.com>, aneesh kumar <aneesh.kumar@kernel.org>, iommu <iommu@lists.linux.dev>, bgray <bgray@linux.ibm.com>, naveen n rao <naveen.n.rao@linux.ibm.com>, vaibhav <vaibhav@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, aik <aik@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 26, 2024 at 09:39:56AM -0600, Timothy Pearson wrote:
> > Just forget about the weird KVM and SPAPR stuff, leave it under the
> > kconfig of the old code and nobody will run it. Almost nobody already
> > runs it, apparently.
> 
> We actually use QEMU/KVM/VFIO extensively at Raptor, so need the
> support and need it to be performant...

I wonder if you alone are the "almost" :)

The KVM entanglement was hairy and scary. I never did figure out what
was really going on there. Maybe you don't need all of it and can be
successful with a more typical iommu working model?

Suggest to tackle it after getting the first parts done.

Jason

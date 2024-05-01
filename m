Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51ED8B8BB6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 16:10:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ETGLEzT8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTzVY2T79z3ccX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 00:10:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ETGLEzT8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTzTn65Mdz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 00:09:48 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-790ff1fa7b3so247581185a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2024 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714572584; x=1715177384; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O1qoEIkOLck4Sa8ZT+0G2TYNAGl2HaO45P/SMXLf4vc=;
        b=ETGLEzT82BqH30kO0N8HHyAYLhF4xLbSNzFWB9+/wkMWB4CPVXZ9dAwJFdO5/QDUWV
         3mC0VpN29BPKdKBJ5sAEZBAz5KVUdIFFZ+AT4v68F9AbQfG5itETorCM3LUqjNptQlLJ
         igc7lcdC29lrUdUYqsx5oD04AmNerJJskIuvInBiioYrBLVrWM53WE699FgV1QK93Yb6
         ebD7x/MZLiB1NZAdCtkLsFqax5WIWPe9yAuaDOKbcmnysHfkjKZJMKlULcNxFYrNiFSu
         CyAI7sHiWq1kunYwZf0rRGNOfuv49O5Q6W7Gm8hRqhK2OczsBbX5GiS/GPqVxmHLZY18
         x8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714572584; x=1715177384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1qoEIkOLck4Sa8ZT+0G2TYNAGl2HaO45P/SMXLf4vc=;
        b=TM9lGENIdOw733w9vrckwG+W7+1TR+l3s7nv4Y45T1fJNjc/Kh7iJpdKD6UHenZN/d
         hJuuNMNk+qIgEF55WvUZvwgnsOP00BGqcepsi4tOxrlBO+Ygdjkzh8a2GeeDJaoHJxXC
         KvskOGocpWmNBsjbgzlfAJpEUGVBD2fOOCwCZGMYQPtnJ6heDD3tLhaILjCcIsc/ry9W
         /Qb7c6/IJH/Q7rRXzSJwxOxXcntQxgkWHjyupBGQ5KVupabu9SWhFqfwX9viVqR4Guxc
         ytq086tC8aTxX3Uh/nxUyw+a+yb5o6K+VSJZ04yYL/BdjHcy2LXdACuWxja2LnEjwY00
         pgww==
X-Forwarded-Encrypted: i=1; AJvYcCU/UTuqq4EGOGT66rPactd4yAJspy0Lr1ntR7yqhg3dRV/B+TXR3rl5Wxt99DIuRJIsyvyi3hkmN2/7lHwk00etX5x/O49X/fSj3xG/Hg==
X-Gm-Message-State: AOJu0Yx5na5UW8uCnQdQNPaLAkxliqTEw8M9UDt7anY0owzPSPqeQHfM
	BgRzcB211Avt5hHd96r7FYR1Zx5CkW2wK3KGfpRftLgN0kyghFnLSYoRsHxgyTU=
X-Google-Smtp-Source: AGHT+IF213Sn1gI+C+Ltfyt/EaM6iz2FDR/B69onEC5U2qmZQ4cFog5+UAuTjWWtF9BXGrAGR+fPkQ==
X-Received: by 2002:a05:620a:4304:b0:790:944d:65b3 with SMTP id u4-20020a05620a430400b00790944d65b3mr2980242qko.62.1714572583947;
        Wed, 01 May 2024 07:09:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id pe16-20020a05620a851000b007883184574esm12405228qkn.98.2024.05.01.07.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:09:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s2AeU-00DPni-Mh;
	Wed, 01 May 2024 11:09:42 -0300
Date: Wed, 1 May 2024 11:09:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC PATCH v2 0/6] powerpc: pSeries: vfio: iommu: Re-enable
 support for SPAPR TCE VFIO
Message-ID: <20240501140942.GA1723318@ziepe.ca>
References: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, aik@ozlabs.ru, linux-kernel@vger.kernel.org, oohall@gmail.com, ruscur@russell.cc, brking@linux.vnet.ibm.com, robh@kernel.org, svaidy@linux.ibm.com, aneesh.kumar@kernel.org, joel@jms.id.au, naveen.n.rao@linux.ibm.com, msuchanek@suse.de, jroedel@suse.de, gbatra@linux.vnet.ibm.com, npiggin@gmail.com, alex.williamson@redhat.com, mahesh@linux.ibm.com, tpearson@raptorengineering.com, aik@amd.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 30, 2024 at 03:05:34PM -0500, Shivaprasad G Bhat wrote:
> RFC v1 was posted here [1]. As I was testing more and fixing the
> issues, I realized its clean to have the table_group_ops implemented
> the way it is done on PowerNV and stop 'borrowing' the DMA windows
> for pSeries.
> 
> This patch-set implements the iommu table_group_ops for pSeries for
> VFIO SPAPR TCE sub-driver thereby enabling the VFIO support on POWER
> pSeries machines.

Wait, did they previously not have any support?

Again, this TCE stuff needs to go away, not grow. I can grudgingly
accept fixing it where it used to work, but not enabling more HW that
never worked before! :(

Jason

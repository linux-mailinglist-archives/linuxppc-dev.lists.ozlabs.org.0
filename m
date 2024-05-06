Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85C8BD400
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 19:44:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ccqMDQ7O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY81S0kvsz3cQf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 03:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ccqMDQ7O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY80j2nStz30Vp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 03:44:04 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6efbd2b15b1so2154645a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1715017440; x=1715622240; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrQdyQAmxtGDrr/un2msxGNjav0moWDiCcc8IHL04QU=;
        b=ccqMDQ7OiQuPg0NFKiQX5GIYjRKTsqv9Y+UdEysjXgWcYnBoOqrgpDajc8hkGxKZzr
         Ii31XYn5Wub591rZCdNBqtQOyEuEIxTjJGkjg/XI0BdNTYSdd01Bi+yezdSD08VEq2UQ
         Ofxc35zF80F/jmJWnJwKqOW1w21AEThpr9QBG4URQtqcElQgsIqAsqcklRFU+R7dPsME
         +BylNOZLMvddYDUEXVRHDqWFiiYhHMQaX/xOd51Y0XRVxBTobLrEYAivMsCXcJHhN+UO
         3zTos1jY+751nfh/OxgI7/kMxCTFe+1Zpj8nZYD8VSNSQ66aeV8qy8R7V7N/1dQs2Ns/
         jWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715017440; x=1715622240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrQdyQAmxtGDrr/un2msxGNjav0moWDiCcc8IHL04QU=;
        b=SS7j0vbSRpav/2orxLDOXIbnNOmlJwEk6BisBkJ8muI7wU8P/jOg/8UDWuUrnQ0/Ur
         USzH3vNRln1qwKjBw9GX0/5L1eYo759x1Q8Hvr9YaxeEoX906W8KfA3dDVeYP7XT7tPs
         Oh09DO/NLpdHB8uQIAfs3aDdjL0P335FwvYVWFAFVzqCe3GofZBs5Bn2u3Bbw0OHDmnH
         1iDjpLFaFV4E037F7McKyPjPMM0ERCkr59cqyp40g5rmjFsX+0Nosfp4gLxDlAI97vpJ
         bdaFWVwwbPAKpJOAvxdQTKz/QLFqvah0D78Nj4jKdKk71f1HSD7fe+D/nc9YGk8B59Mb
         ipcg==
X-Forwarded-Encrypted: i=1; AJvYcCXX1ppPMGQur1AXhWzFflKNMTbUhMgzmCqsME4uV58/GzRgEkhJkVpigwgyJcV7QEY7syun197ydJT+mJ9ZnFu1msPO7SRHYqzf+FaodA==
X-Gm-Message-State: AOJu0Yyq2lD+/GQ3jSuAtTLFtUZGYYJ0bFPOiD69HmSJC7sL/O+VZhxb
	PwXbQlyLtf5EYHtacr3UJhNfPF2MFgDGBKISMuBwy7Di+gEQmIaMiBzlEzbV6Ec=
X-Google-Smtp-Source: AGHT+IFfws1Gcb6acoXVWBj5aeFUz+NzC1+evoEYOr7ky0Ifa7neFHPAAV511Z8X/ku679UyYkztmg==
X-Received: by 2002:a05:6871:3a10:b0:23c:49e2:bac2 with SMTP id 586e51a60fabf-24019c343admr143784fac.18.1715017439642;
        Mon, 06 May 2024 10:43:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id co13-20020a05683065cd00b006ee2fc97885sm2030608otb.72.2024.05.06.10.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 10:43:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s42NZ-003UHM-8o;
	Mon, 06 May 2024 14:43:57 -0300
Date: Mon, 6 May 2024 14:43:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC PATCH v2 0/6] powerpc: pSeries: vfio: iommu: Re-enable
 support for SPAPR TCE VFIO
Message-ID: <20240506174357.GF901876@ziepe.ca>
References: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
 <20240501140942.GA1723318@ziepe.ca>
 <703f15b0-d895-4518-9886-0827a6c4e769@amd.com>
 <8c28a1d5-ac84-445b-80e6-a705e6d7ff1b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c28a1d5-ac84-445b-80e6-a705e6d7ff1b@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, aik@ozlabs.ru, linux-kernel@vger.kernel.org, oohall@gmail.com, ruscur@russell.cc, brking@linux.vnet.ibm.com, robh@kernel.org, svaidy@linux.ibm.com, aneesh.kumar@kernel.org, joel@jms.id.au, naveen.n.rao@linux.ibm.com, msuchanek@suse.de, jroedel@suse.de, gbatra@linux.vnet.ibm.com, npiggin@gmail.com, alex.williamson@redhat.com, mahesh@linux.ibm.com, tpearson@raptorengineering.com, Alexey Kardashevskiy <aik@amd.com>, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 04, 2024 at 12:33:53AM +0530, Shivaprasad G Bhat wrote:
> We have legacy workloads using VFIO in userspace/kvm guests running
> on downstream distro kernels. We want these workloads to be able to
> continue running on our arch.

It has been broken since 2018, I don't find this reasoning entirely
reasonable :\

> I firmly believe the refactoring in this patch series is a step in
> that direction.

But fine, as long as we are going to fix it. PPC really needs this to
be resolved to keep working.

Jason

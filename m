Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E51F99E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:16:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ltgQ5KZkzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=ed8Hh6W1; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lt102rKXzDqY2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 23:46:55 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id q8so15675363qkm.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 06:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5fbwAPFhj/t9OUXsbkBLa2lLyWbmpKqf/KaN0uZtDRI=;
 b=ed8Hh6W19/qv58dB6PJ+JDjl39VwebBT6j8EE97r3JHHDfwiJzt2hWVj16rCe6/VyG
 TGS6SE6ptiPexO04eKRNwcc2SavSPpI4Y+CNvCCPSLOeqvoWAFB5eirFpEK6+oB0wHHn
 YzrrGXXq34tALTQcvCQ5jV7jNVPV1gaoA7dxV+Ww8bCsTfAxqZWkLH2X+TRnp6v1UY/n
 5HvDJCpObIPTLoiUUvWm+Bh/6YdsUHOii7rZ0rTYrZCnagGu2eBunuySbs4KjAKcsich
 MHcryQhOUqxOkk25chIvq/NKjlr7ebKpn+uV5+YAUDcny6vx0EfBF5i2EahuqiwvnIGH
 ZLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5fbwAPFhj/t9OUXsbkBLa2lLyWbmpKqf/KaN0uZtDRI=;
 b=gwDbKkiWsG/OSgjX/f0KsNh9OKQUtwWqffkPZEgO7L87MgkY4Qym6VSCes92Ylre8J
 UVA9l7P+IdzFpRWKyV0T1amY4vC39oQC5ajAGeJfmYm2V0FwfSy4i/2fgAO89qVixLgT
 CN2VDxvSOrpY9RzAQbBHkfy1BnxHJ1G0MCvekdxbopiNP8eI2YIAHnvCER3Uohnq6KVD
 EKnHZq6RdjWuKut5+tJDJE81Wr0o3aCNMeDrgqaKTX9zfQdWsc5NdeYeLXiEtV2aJDL6
 ZDEmhyYAZowEGy1IIhEtiDPgNb7dyFZ3NbNm6Y2Sq4R5mIWBkt42axF8gYxx2CgjYF/W
 CeUg==
X-Gm-Message-State: AOAM530H9kJeQvNJfRBYnH5kmRaKmkVvnh/hE4TBLvibP0qbK/EAVzC3
 ivvAacKP63hp49GwYCWzNAdOcA==
X-Google-Smtp-Source: ABdhPJySxHjK9XxwDJnFQN4DvhgJhASkwz/NHGoO8h3oIBKNCRR+t8iWEXyH5O1Z018vigBdL2M9HQ==
X-Received: by 2002:a37:bfc1:: with SMTP id
 p184mr15321144qkf.207.1592228811377; 
 Mon, 15 Jun 2020 06:46:51 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 124sm10100237qkn.45.2020.06.15.06.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 06:46:50 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jkpRq-008aTM-EI; Mon, 15 Jun 2020 10:46:50 -0300
Date: Mon, 15 Jun 2020 10:46:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: refactormyself@gmail.com
Subject: Re: [PATCH 0/8 v2] PCI: Align return values of PCIe capability and
 PCI accessors
Message-ID: <20200615134650.GA2030477@ziepe.ca>
References: <20200615073225.24061-1-refactormyself@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
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
Cc: Don Brace <don.brace@microsemi.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-rdma@vger.kernel.org,
 linux-pci@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>,
 esc.storagedev@microsemi.com, Doug Ledford <dledford@redhat.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, helgaas@kernel.org, skhan@linuxfoundation.org,
 bjorn@helgaas.com, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 09:32:17AM +0200, refactormyself@gmail.com wrote:
> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> 
> 
> PATCH 1/8 to 7/8:
> PCIBIOS_ error codes have positive values and they are passed down the
> call heirarchy from accessors. For functions which are meant to return
> only a negative value on failure, passing on this value is a bug.
> To mitigate this, call pcibios_err_to_errno() before passing on return
> value from PCIe capability accessors call heirarchy. This function
> converts any positive PCIBIOS_ error codes to negative generic error
> values.
> 
> PATCH 8/8:
> The PCIe capability accessors can return 0, -EINVAL, or any PCIBIOS_ error
> code. The pci accessor on the other hand can only return 0 or any PCIBIOS_
> error code.This inconsistency among these accessor makes it harder for
> callers to check for errors.
> Return PCIBIOS_BAD_REGISTER_NUMBER instead of -EINVAL in all PCIe
> capability accessors.
> 
> MERGING:
> These may all be merged via the PCI tree, since it is a collection of
> similar fixes. This way they all get merged at once.

I prefer this not happen for active trees, it just risks needless
merge conflicts.

I will take the hfi1 patches at least, let me know when they are
reviewed

Thanks,
Jason

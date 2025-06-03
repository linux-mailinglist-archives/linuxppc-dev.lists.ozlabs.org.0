Return-Path: <linuxppc-dev+bounces-9098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F222ACC7FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBWwH6YnDz2yRD;
	Tue,  3 Jun 2025 23:37:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748957823;
	cv=none; b=GFl9QcDjt8yPSpU8UeYGA7qQlCaSyZMnqMCZ/ThFnW/hJ1ragZBeE2rPFEhEUEvVEI+fX2BTmQQz1h8g9XeE6S1m7W/ZtDOLorRMfR6kx62reYfamCzXJ+RScJlO2S5MmUvtYWd8HOTI8OWxr0oY8nzUBsDReOR4UPXO0PxhucukMniIYettoIEMq/9MDQO6l0ccdGQ/JaX7LIVmlConW23Hz/QAk08N73sXJXJ7BCChkfmXc+u1hvsS7DH3isjWFcgFhhqg1eDnLUwgb/NJc0fcHgNPQLo5pCb7Mg6/+29dnFpkOYb33jb+0nO/WE5cCpxOqTICjdvZUpxq3nG29w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748957823; c=relaxed/relaxed;
	bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epOa4XC6prGF45FJEiFYzlu05fb9QLdSldRxzv7GYy3F3JhPfhE6jUUTH7DJQtNwzcJLoBmAc6IXuCQaG3EfQjX0SJiD7JiXbOjdTZe7Rv/Wx3isCUMmCQF3MWUx2lSPuNmLRjwXPkd2pBDfMC7WWEgWIJsSVlPjuMzDt6nrICvT3wV9xc2SGaQWlqyZOwFnNsNeaTUQLIzLhKVUsJeAJFcoC2Xh78DtJ1BcTTf2NcobLkV52X11EQA/w96ncD1YILEdh4e8kBX533xbN7e0cM6xodpA7yrcz5Woh6Y++o8xeBwtYjesN5tOvsStiP89cCMhsEFcFWUteoNjM78kAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bcv6CrDH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bcv6CrDH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBWwH1gMsz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:37:03 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7d20f799fe9so127536685a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957821; x=1749562621; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=bcv6CrDHOmz0eFrzdhfe+U/IEcDms7fYzFWM0LsezRT2aoe7NYgqLMDrMX8CYl+po4
         XJil9CQYzgQf1e48lDcToDEryYNxOUd03nVbs117Wx+H2FOLr7hhh4kSpJ4WwUWQH5Ur
         mYRX4nb4XAhE2AKv+tCYnza+pm9+deOZsMmtHTjU3lkNSJu6AUZ3sudgPoXymaeDQ4WI
         5BSfHxuVlbmpFskxGrAA3+6xqXzL0saRnjczSeGstuEl+Om99ZUefScYTgPY4dFZu+QE
         1huf4r04iWqUChWDSz6mWWR/C4D5rEK0an7YGGmrZLbEPlDx7W3nEPmFekfpRyf8f2T2
         OSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957821; x=1749562621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=NmeTcuOaZm62FCbT//FmAn3+1+UWBRI2BR0R14L3BpeM384+eDFO+xwsDtaNDn+rDa
         XqKH4mvsaWtmAxlLnLOG/52f9NG3g/gt7ib3ivruX+lpsX9zlNnQgE8e7OEP7m8S0Pvm
         tybWbRD2vEFs0al4wyiMOlQplC2F8WyKwMJpNB6agNEwllfnNc+OkcxS7ISP8jP87tAO
         zZIed8hN1+gLymaRN6SKnGN091zgxvu3p1xzmGN0HgBWLUp2XMxj10U6+YHhRzmJThOl
         CbzHDfHKzZdbVSYSBG0WDwt/VL9jrSl2kQo4lq6B13r4fHUzQnEjUaJe5B6+7F3BSTCZ
         BXag==
X-Forwarded-Encrypted: i=1; AJvYcCWNw8ax3lHJ+2xQLcPBgX5PrhQVY0I4AFmbb3p64Jr/e+AeG+2g+sI/mX6Y+PA0iaP6sKR3KH1kvGOHwow=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3+zEKA/580khBJ60uytAwaAHn78vDzEumxdVF9lvSkLAJ0cJp
	+2z4kewkNocqifzUfQuNt87DNn0MuAk6H7kaX0eatNubYz/y6ilLTwerpOFOnfEGOK0=
X-Gm-Gg: ASbGncvpeo+JjNVWzezYAtjQDM5HuN5oCMAYI/HJK7ucK1bjgvnIoNISuizQbpNnqS/
	QvfGgUnmAGsoy7Ephgkti5SBZR3hqVmr0BJzHQpes63NVUABwEBfRGYd/YKB21vlqfDcY0fVN8v
	EqO15DAmrXUtHlYvEK605f+Refg1wPguu2T5I+YSaArB7QqJivrmxm4/BBBW8YAkOgiSm0Nx6BK
	2ZlWpp6Kep2tPwfW+DXRu5y6/YIC3JNNcPO2LE+RX+hc12M08Cuc+JnVavn3hQZw6FUOTGzW2W8
	in98+U9QXtI6XJ8kQFqy3yfIfQwzs69tX/2SJGJdDpC9SxDKJP7cvxFBpGz+MAXRz/oTwaNNWvf
	k88gazisMbQbU2S6YXFgRhtAivsQ=
X-Google-Smtp-Source: AGHT+IF/1nQKKWghBymIv6kapapYp3T/T+mDb2uBcjAQYD1rkFwd/p2CMx7wy82AG8RXeUKzw729SQ==
X-Received: by 2002:a05:620a:4408:b0:7c5:3d60:7f8d with SMTP id af79cd13be357-7d0a1fb91a0mr2626422385a.19.1748957820692;
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0fa38fsm842635185a.35.2025.06.03.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRp5-00000001h5Y-2rWO;
	Tue, 03 Jun 2025 10:36:59 -0300
Date: Tue, 3 Jun 2025 10:36:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <20250603133659.GD386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:04PM +1000, Alistair Popple wrote:
> Previously dax pages were skipped by the pagewalk code as pud_special() or
> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
> refcounted normally that is no longer the case, so add explicit checks to
> skip them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/memremap.h | 11 +++++++++++
>  mm/pagewalk.c            | 12 ++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)

But why do we want to skip them?

Like hmm uses pagewalk and it would like to see DAX pages?

I guess it makes sense from the perspective of not changing things,
but it seems like a comment should be left behind explaining that this
is just for legacy reasons until someone audits the callers.

Jason


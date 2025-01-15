Return-Path: <linuxppc-dev+bounces-5270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD1A117E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 04:38:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXsCz6Kqnz30gv;
	Wed, 15 Jan 2025 14:38:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736912319;
	cv=none; b=fZ1vLFqSWrGvgxe/KjhVmQaz3gPLmuvh8W+BV9YjOjySlYO0GoAIP8Wuvi4Mj0BE66LxVCkB/0yzbBJ5OAdyq+CkSKzXiRjJ/cWTklPihjNM+APDqCUI6j54XQ2Kq2GZF8ZS3sq/8YE2qcLuPW2otJtrOc2vV6FqTg4D5K60tYp/gFhGFgPYY4+cyPntWIjxbnAfclJl8agjJkPHrFSQQvcpUcFMdm66OEXH+60xa6BpNK0gB4Qu2RgOyBQKRJUDdKoVpS3OEYglVoc8v6KavpMtB+NhcJTx2waS+GLy0X0/+5KWIqKYYQWdWzXHd7JdBIl1o0XmyYh/RR3WEuqnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736912319; c=relaxed/relaxed;
	bh=ggG1Vuf9tiZ0JKZNDTMJJvN8O1nAUNZ5coZeOdFCGi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WChWZ6mXj8JOYaem5/0lemyQUwQu8JI75JjIbvuqwEmfpeB/oCA4ytn4E2PXXDZGQrYX5F9xchiuA5wSlWxlak/dW1e1quZOtXr5AN67uaX6Ycyo5HY+f4PiSz8BcbbmkfOn1gYLWY+2SN2p+F4DGwMXHdhjDyrO7WFxbQv7KuBn+KalD4LHHYv/KTmiFJ5iKJmhfRlbmz3agv43kcQXD7WT7u5hFvc8YscH75d0re1b1jukcSL91wTWjen6xkKylTwcxFd4z1zWhtjn1tDzzr6ckC3m1pvVYjLglSYqWpiEOrsItCXdSVZnHWFwyL2F1H6fK406teZDG7NxwyoHkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jcjWoFWQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jcjWoFWQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXsCv6dllz30g1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 14:38:35 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e54d268bc3dso11146432276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 19:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736912313; x=1737517113; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ggG1Vuf9tiZ0JKZNDTMJJvN8O1nAUNZ5coZeOdFCGi0=;
        b=jcjWoFWQ9Viv4RkHVst5s4JoNQttg+EA8jdGBqrDS4wNBDtRlMlWir+T2OEP9b8Pqv
         8KcXcURpZTBa5ses0zZzTBV3F8qhEkH+GEmIUJtT5v51HHNQR/pEZYuWdGDbBS0DEbh1
         Ys8Leq/is9a93J5XzQDURO7sA+nUCtdNtpa8o/MR9VYr0ZF1qxuSSaWCPuYTzciFkC1o
         DhSwD/+9pLVI3TGXTMZ10IEsuWBklSqzV+8Zp3mKKeKWDAMPMYiEdgIBB/ZPItAUUvHN
         lENcJNkIlu2bigd5yYDwped53hJDlOjKkif5csUKSDeHZAs9/8qOIcgctY7SYQPG35rc
         aQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736912313; x=1737517113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggG1Vuf9tiZ0JKZNDTMJJvN8O1nAUNZ5coZeOdFCGi0=;
        b=dNJahYyyy/bNXqZFGbpXUc3luMUENglNGHhpQ6uuGpPpH2fcowRofS700cKzAL46M+
         4ZNvp3NgA0sxhV7mozLxon6fpt8rrriD7UUyphsn8qYRK3l4yYwobjSK6ZtUnWJpdK96
         CZHDyE+EkFR9XWG+tR03MxoHU9NQYX1tX/4Dcg6SGP50loI/MEPJSvGSkQGImWbAEHsN
         nKYtDmM9E0BA8QQmXw0sv+VYiFFH5K0+xCWJVcN3Oy70pO7XkstJGAAMN7Jw7UaBZdOw
         z2PXTotFDpixA4GWFbZud187/Pl3v/XY1nNXheB5fPIwDkSUt6oKi5zqcXkXmEB81qq+
         MUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZuZOu4RuSEySGcnuDdW+tCGh06zidxJ868I30ds9oyZ1oIm4PUA/2cwkynCHb9O97F4L/ZjQIWsoYpZI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzoLyVTGBM13UtmwlcmIfo1mnRILftGOjxmj7s/vEtjlSV+q00f
	46e+gWw2CfkldHUoh8U4h1q9LQ8j9pa4e4c4In25PVWS8DXExEza
X-Gm-Gg: ASbGncvSCJ2EQaT+FtDmVOUqtlmYthYkZ/9+y3PYd2PIAeZ2IcaWqREOPAibUWIg54B
	NhhYhyZRLu2b1fELaVLUW9IIIB200x7465b+BSr//yBrKebJrRO7esv2iqUOwyxzERZrpXsMrdz
	h8NYBtuPBovbTWzfWv77fQOODdydVU6tfj83Yi0A4RDvgZYhMHwyO5nEcga+29IAMDc8UvgQnKA
	c3KxpbXGF3lJI2sc8QEFPeTlGhho+OWwfL26CFRxm/EUrCAEn/UwwAL
X-Google-Smtp-Source: AGHT+IGcxF5UAr9VMjmEWcxKQm1jPE9VpwQlX4HhGZHkGGwOlZgKnKfAZqEBywSv8uk39tmS/FGABQ==
X-Received: by 2002:a05:690c:62ca:b0:6ef:7d51:eba6 with SMTP id 00721157ae682-6f5312a8384mr216747977b3.28.1736912312722;
        Tue, 14 Jan 2025 19:38:32 -0800 (PST)
Received: from localhost ([2601:347:100:5ea0:e12f:d330:c8d6:a6b7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546dd712esm23854477b3.79.2025.01.14.19.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:38:31 -0800 (PST)
Date: Tue, 14 Jan 2025 22:38:30 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH 06/14] cpumask: re-introduce cpumask_next{,_and}_wrap()
Message-ID: <Z4cttq0dfHnapkUI@thinkpad>
References: <20241228184949.31582-1-yury.norov@gmail.com>
 <20241228184949.31582-7-yury.norov@gmail.com>
 <Z30r/6S8VBU8/Ml5@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z30r/6S8VBU8/Ml5@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 07, 2025 at 02:28:31PM +0100, Alexander Gordeev wrote:
> On Sat, Dec 28, 2024 at 10:49:38AM -0800, Yury Norov wrote:
> 
> Hi Yury,
> 
> > cpumask_next_wrap_old() has two additional parameters, comparing to it's
> > analogue in linux/find.h find_next_bit_wrap(). The reason for that is
> > historical.
> > 
> > Before 4fe49b3b97c262 ("lib/bitmap: introduce for_each_set_bit_wrap()
> > macro"), cpumask_next_wrap() was used to implement for_each_cpu_wrap()
> > iterator. Now that the iterator is an alias to generic
> > for_each_set_bit_wrap(), the additional parameters aren't used and may
> > confuse readers.
> > 
> > All existing users call cpumask_next_wrap() in a way that makes it
> > possible to turn it to straight and simple alias to find_next_bit_wrap().
> > 
> > In a couple places kernel users opencode missing cpumask_next_and_wrap().
> > Add it as well.
> > 
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  include/linux/cpumask.h | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > index b267a4f6a917..18c9908d50c4 100644
> > --- a/include/linux/cpumask.h
> > +++ b/include/linux/cpumask.h
> > @@ -284,6 +284,43 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
> >  		small_cpumask_bits, n + 1);
> >  }
> >  
> > +/**
> > + * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
> > + *			   @n and wrapping around, if needed
> > + * @n: the cpu prior to the place to search (i.e. return will be > @n)
> > + * @src1p: the first cpumask pointer
> > + * @src2p: the second cpumask pointer
> > + *
> > + * Return: >= nr_cpu_ids if no further cpus set in both.
> > + */
> > +static __always_inline
> > +unsigned int cpumask_next_and_wrap(int n, const struct cpumask *src1p,
> > +			      const struct cpumask *src2p)
> > +{
> > +	/* -1 is a legal arg here. */
> > +	if (n != -1)
> > +		cpumask_check(n);
> > +	return find_next_and_bit_wrap(cpumask_bits(src1p), cpumask_bits(src2p),
> > +		small_cpumask_bits, n + 1);
> > +}
> > +
> > +/*
> > + * cpumask_next_wrap - get the next cpu in *src, starting from
> > + *			   @n and wrapping around, if needed
> 
> Does it mean the search wraps a cpumask and starts from the beginning
> if the bit is not found and returns >= nr_cpu_ids if @n crosses itself?
> 
> > + * @n: the cpu prior to the place to search
> > + * @src: cpumask pointer
> > + *
> > + * Return: >= nr_cpu_ids if no further cpus set in both.
> 
> It looks like Return is a cpumask_next_and_wrap() comment leftover.
> 
> > + */
> > +static __always_inline
> > +unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
> > +{
> > +	/* -1 is a legal arg here. */
> > +	if (n != -1)
> > +		cpumask_check(n);
> > +	return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
> > +}
> > +
> >  /**
> >   * for_each_cpu - iterate over every cpu in a mask
> >   * @cpu: the (optionally unsigned) integer iterator
> 
> Thanks!

Thanks, I'll update the comments.


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4017A41A27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 03:59:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NqmV14pPzDqyB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 11:59:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iB1LNB5E"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nqkq25wRzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 11:57:39 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id w196so10499163oie.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 18:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Z9WC8IIuQYglwsQB0e3uL6ecR5E4muSXX477jTQGh8=;
 b=iB1LNB5EGSLpo7WgSDBrPmeEMZ93Mel9h5ylZ9HqRqs1gJhLWN86/njzn4XJevfmCu
 db3MlOx94hwD3ngUE2V7wPLLQ8HFc5X/4aaCDN2LInVyw/NM0aIpWl22dzBLXUiOfS1g
 sVBPhMzZAMjbsfr+JpAirucC7TFI0YeoWXBetnhPW2Iba/wwmBQNQFrKomZOQz9KMmUA
 RKAhyYOHYT8QhUI5dl/veYPT/Bz+7gJcQA3o40NzSL+6wPjw+zGQf2xoYcrnbBo0NVsb
 lWLvihSbKerJyuzT8gFbYbezGSA3mRft0Jf/NdHGVzmRuEQ3sp5xFAAvgi9i+i2vZFVM
 u+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Z9WC8IIuQYglwsQB0e3uL6ecR5E4muSXX477jTQGh8=;
 b=lWA0DcUbe/bSrrAvFTr8AFMiKuazOeJxiK6xxgl4WlPC8vbty+V1Luldgk7Nvtjphe
 58ojFVGRsovcrrHHOEHF/sokL4LIbGSP2c6Xxtq0/icWaZ463E87ma2ACxaGA05YHl+E
 QZ1FfNgGUp8I6y389r7LkC7BzUpNlfjXGYtwfqAUVcPiXk7w3k1Y+ceVqk4Uw4gcOk63
 KCg5TUqsXlM9def8UosqMbAi0UzAOwvuXsSfR/VL7ztUQu5q19LexlWT+Furd8ZtTc7U
 +3VV5uu+q0fFxnYo2H+B1bOmdKTGVj2GfsoRgIxg/cPGnyBRCSQ6ElF4TMq2fhpLfwnN
 XneA==
X-Gm-Message-State: APjAAAVQ4E35Ba6NgudhGOeJY01S9piKaalpiZJH30vjrMKTC6jTij2x
 /9GBBNFyjsyctrwHbC4okj6ewiTB
X-Google-Smtp-Source: APXvYqziy+hwOJ/rBxaZYDd+TNhUBY53RQKM+KiMF+7YIA5VTYBc9yXxbDk19EaodEyzL0xN3GIxfA==
X-Received: by 2002:aca:6208:: with SMTP id w8mr17923394oib.128.1560304656060; 
 Tue, 11 Jun 2019 18:57:36 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id 41sm5775218otm.6.2019.06.11.18.57.35
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 18:57:35 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Aaro Koskinen <aaro.koskinen@iki.fi>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
 <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
 <20190611060521.GA19512@lst.de>
 <5aaa600b-5b59-1f68-454f-20403c318f1a@lwfinger.net>
 <20190611224623.GC26504@darkstar.musicnaut.iki.fi>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <74c8af35-6006-5ca8-0fe4-b5938b1139ff@lwfinger.net>
Date: Tue, 11 Jun 2019 20:57:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611224623.GC26504@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/11/19 5:46 PM, Aaro Koskinen wrote:
> Hi,
> 
> On Tue, Jun 11, 2019 at 05:20:12PM -0500, Larry Finger wrote:
>> It is obvious that the case of a mask smaller than min_mask should be
>> handled by the IOMMU. In my system, CONFIG_IOMMU_SUPPORT is selected. All
>> other CONFIG variables containing IOMMU are not selected. When
>> dma_direct_supported() fails, should the system not try for an IOMMU
>> solution? Is the driver asking for the wrong type of memory? It is doing a
>> dma_and_set_mask_coherent() call.
> 
> I don't think we have IOMMU on G4. On G5 it should work (I remember fixing
> b43 issue on G5, see 4c374af5fdee, unfortunately all my G5 Macs with b43
> are dead and waiting for re-capping).

You are right. My configuration has CONFIG_IOMMU_SUPPORT=y, but there is no 
mention of an IOMMU in the log.

Larry


Return-Path: <linuxppc-dev+bounces-12779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3CCBD006D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Oct 2025 09:47:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cksyW4tlpz3cYr;
	Sun, 12 Oct 2025 18:47:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760255251;
	cv=pass; b=gfJz2iuTz+QV1VYKEDFm5RIhMAoW1iFlJgMr0aFxa/bl566I841lIGc8UrW9EirAEW4xjWQUm4rWgmM5wki6NggCjDgN0S7JKg8cTb7AK5JikibYXdvNbySqRCWo+/uckuMUeVCEmxLjmUvR70qbuCsz8ztUiTd4/0H1uMs6EaVNSFYtDm01/ErNmZiu16IpxPxQNfgJ7HcsbxkUKh0YsbOCS6a6AiO6IwiS1HrrBxEPspBODKKa7TzxvlFn1DjKy3MlBlvJIhEdysKNs7GhDcRLrL91apvN6wMnVKf+NV5bMcINOwRVTokz0zlosDSRzt4upd/MPwu9lrjbcVCkRg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760255251; c=relaxed/relaxed;
	bh=YJv1nwlpb1FE3XNGlM26PFKd0Hvc2WtDFiInGBfhNoM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=A4/6/uJ9EYq8vmP9Z/yPRbjIGa2+f0eLFc0HXRmg91gkCIq+zr6vHVFRLbiBD0EmK+OeNSx7x59p8VK0F1pw3R2qLft1K9fFebWfafrDSsIAt1JFuQSOYzRJrqTknBFTNFqV/XN+OMrQK8u8VVk6An6TRMrUNd8sZKzvpOFmxuCwN4PNFik7nG51dCyuXzyaaxiUjxugVCORUDIgZREPRUIGpLjDAG5JUoYofznIPrVmbNrgHn4+Re3v9KGXR2BW5z4CfqeBhG3IakS4/ED7XCvO3XENnGaAwjyBKrypH8gNu34zzjEajZtk//YqrZTI08gpEjQkIjRE2hOSHZCGTQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AqlMkZ04; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AqlMkZ04;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cksyS5tXQz2xK4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Oct 2025 18:47:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760255236; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jCPGN0wSzOvIFAcHgRB/NvFUUO8Ku/UTye3Vrnv0ZgeSFNJVkDpql006xOmjN8EuqP
    DqeZK1x7yL1YMnoaN9Twfey+jenrsYqtRNwPhRCuObs5RAiqOexRZgiaAHGqK43BC4Yi
    OLi8yU6rmk5CGNfz9XO4/UFqEL8Sqw9xhGl6O0bTIGJy8GjxiFGX/wW/hTCK27fUNaJm
    eMJ28/qINrS/kzFUugQb3inA3GoeLc5uyXVHPCtERnGbYcC0RNxG1ENVPVA6Ai7+MQoI
    /NUC+ou9soFrx+28jJbsHqVFe3fW+7JtvPY7JCLKcVU3rCwLaWSE/nSskuMKl7aQq6ov
    0fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760255236;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=YJv1nwlpb1FE3XNGlM26PFKd0Hvc2WtDFiInGBfhNoM=;
    b=NVKC4w60vXO3wJ5yZs91qX8GrOwiwqV8PC1rmSYYnVxwDBvAU6lUrSSUQnUGxuk4mD
    oBIVOoYeE7yWd7RXyvYSdJHBCGa5BTLFxGx9/hbDvMXoczxl8s0HSsZBWVXn42pWLJvI
    X0OsUv8MlR3M/r64GB138Sih9Y8j4GZgSfMzmL682NcmGH/B2A5qXD5a7EHWUW4SY0uj
    43wUbKNyZKaLLpZF42/wYhWCHhxKzSzeAS8PGkCN9xcj1AaPATwjUCVrYxEbOkHuzOhl
    HhoRRnPMibjVmwCbJ+X1If0vxpmm2R7Kcc6Nx/Jc9/10+BkULjW891tHyxhh8zgKmU4w
    vYtg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760255236;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=YJv1nwlpb1FE3XNGlM26PFKd0Hvc2WtDFiInGBfhNoM=;
    b=AqlMkZ04GST4rXRXL/7c/oLwVo4rz8GDMnuy0pgdT1DcZ91Li/isofeLrIzdF2KHFP
    h643wl3yFGZHZ3Xek0MmUMNg72c5NeRBU54dmbq71YEibl6pslJatkC6906g34Olh+C4
    aM1hlgJa5Y3vBYG980rZI3X7Duj9yPTA/BahnP6WVkdrhVpRA1OCxm2HHYMU0iVahCfZ
    MyKbisf83q/8csdehDe6VbyGpZbvDXHol07s+apVxwrg9l1V9AgzPCjf8MvV9mLwWJCA
    2DYlivcFtZfp86MDkd4WHUi6a9G7SV0tw3SmBOcCMsmYyPGgpCYyHeFSTki3QrGLLHa7
    ae0A==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+m6Xc="
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619C7lFIMI
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 12 Oct 2025 09:47:15 +0200 (CEST)
Message-ID: <6ed8f4f0-8c8f-435e-a8df-2dc51773d9fe@xenosoft.de>
Date: Sun, 12 Oct 2025 09:47:15 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org
References: <iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
 <10994220-B194-4577-A04B-EBC5DF8F622F@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <10994220-B194-4577-A04B-EBC5DF8F622F@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11 October 2025 at 09:34 pm, Christian Zigotzky wrote:
> Hello Mani,
>
>> On 11. October 2025 at 07:36 pm, Manivannan Sadhasivam <mani@kernel.org> wrote:
>>
>> Hi Lukas,
>>
>> Thanks for looping me in. The referenced commit forcefully enables ASPM on all
>> DT platforms as we decided to bite the bullet finally.
>>
>> Looks like the device (0000:01:00.0) doesn't play nice with ASPM even though it
>> advertises ASPM capability.
> It’s the XFX AMD Radeon HD6870.
>
>> Christian, could you please test the below change and see if it fixes the issue?
> I will test it tomorrow.
>
> Thanks,
> Christian
I compiled the latest git kernel with your patch but unfortunately it 
doesn't solve the boot issue.


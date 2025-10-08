Return-Path: <linuxppc-dev+bounces-12717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0651BC6120
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 18:47:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chf7T4vJNz303F;
	Thu,  9 Oct 2025 03:47:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759942053;
	cv=pass; b=bMwXNmjy3MpWfyOsVJ4Rgof/Bz/TMX56xuLx0CgCTkvNz3cYZFSsdQ9unHxAGUbxxhJr/mv/3ER2v+Pb0yZt/YBZ4UBztzOK0xi1z3bJJ3GIeaUd6RQHHoAfDMAdYauHQjeJmIXa3mrDqwEldtK39dC8paiQKhfcq/okvfdLbNWcAuVprGt4Icy/W1OxuemHpYO6ZalgNmL5ATOQiCILp8O471MqYoPUJZdTk1twruUAdtI78hqmz768OCk/NzhDuwOR8Alt4iimyp8at8BxGBux1qduvR9fXHrpjCMFewm8inAQJBb9eNddM3Hf/5qdRYHqE0ko6T26W8zV5YpVDg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759942053; c=relaxed/relaxed;
	bh=FEGPIVQdAIwtHVZOdavnb/1ru+OaKX6ONG+H/kTCp5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6Rak/d8uz4MhUIcuLvuJKlH+j/XEuXN5/60Sxc3L4Q5pSeTxQadx5EXYvOZNve4rvWaFIUypE19Wh/GcZUKHZ9RRj2XzQNX7cT2QDwwkckZrfoSJ++LRsmS1BbY2gMEoLLLxLmeI+0n5xrAyDXDRGKW8CATIKv3meBBtJWbxNZjwDaYcA2WC/zcNp9XF+oemDV5DANDKL+EeJuzDOoBBrZD3460839ttJGKhHNVZ9G+/Uw3ZCVqemp7v8KKX3seSXJzWc+XHcvg88VpUwkfwce6TLC8m09j+XnafJ2mq4XumWnPk3Y/NK52hjZXEwuNNxfV3Lc6zaffc/dcLFihpA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=NP5HyNjL; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=NP5HyNjL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chf7R3x6pz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 03:47:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1759942042; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bnb49V6XM//2DAgoQWO1YfgXMg2KI1AblgBp2b01/US24Kb5smn8aJtZOMhs4ij0J5
    QhgLKPQ1E6jhAeyhEHEJUBrft5SX3dCi7l2HEyur8zDi4fkvRWOVuSNxSg5T5ghYn0n0
    l0LGNzCJsa2I9ZGZW4ouejtUP9V9kwGxKOM4UvWkfBA+Y0GfdNQM2C3WPLkqYylNj/RJ
    prNyMtqJwUZ2X1i0HNN8VncXiwjaKzZIR1Q3cdttSlaiu0wMYS2oW5ZvjJO9NVnBjS6a
    s1tPMRVGjwkTYDFe44m4GGGgwoFxMU7W0gAlRXbfRYDJK7CgkskeE7vrhYjmEONSzDLZ
    CuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1759942042;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=FEGPIVQdAIwtHVZOdavnb/1ru+OaKX6ONG+H/kTCp5U=;
    b=knzKEBfLT+nJ2Yyu715li4/Pv1Zrop6BD7EtkY9RWTHrsPKZ+ObsN1R51n/DZFiB7M
    5B/tBoRdqNRWFkbZKS2HBipxzEtU6a2gRuK6s2zjjnVM26Bj3HHIlr79CTe0Y3YLOu/A
    Sk89L4J4JciUEYvYrH2jYX00LgoUs3Av4Snbs9k4coztN3s4ny0QXdr5TNdZnSPr97yz
    u6rsNJFyDOKIZvXDhX6sfz7w81S1+DlpO83tmLpQLeqteyaW8ktiCaFu02H1AcDQHcRK
    J0uksbekxIrRC9oFDRdgaL6b3w9B1oM6e+okePeZHkc6tMVWUXEbnZ0DgD4WgQMqQ3MF
    NVAA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759942042;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=FEGPIVQdAIwtHVZOdavnb/1ru+OaKX6ONG+H/kTCp5U=;
    b=NP5HyNjL2wY+iBeCD/SsNTr3/zxzVAYn0v2Y3I3MXeo98YVF7qr1duwv6cUQdewp82
    Q3n8uxcmG9ah8GsAOA6nH77eYVwZ73rtK7DRAhAN69cGb8ppsa8Q2Yq9Q5JQPD3UWAXf
    /+uUntGAJ8zpUk7x+Dm0c1rAT6q228bupY0lapoRjXiuI5QAzYMuPXFYRi1NbxHBXwRc
    2/7zKQyp/g6+65N3qEjJbFJlJqb0L1dizmXhNzn9Oo+hxxuLwOJAdZweKtaDcIeGIU1I
    67iGgdqH7Tyq2dwmNLrPA168pcb3WFVpbe5I5CsTSOgkHJFyZfz14C8s/JjSjJvdfJ5D
    wrJA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIy+m7hjg"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e28866198GlM2HJ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 8 Oct 2025 18:47:22 +0200 (CEST)
Message-ID: <5c73197c-5c27-4ce1-bf3b-28c248103c74@xenosoft.de>
Date: Wed, 8 Oct 2025 18:47:22 +0200
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
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
 <17e37b22-5839-0e3a-0dbf-9c676adb0dec@xenosoft.de>
 <3b210c92-4be6-ce49-7512-bb194475eeab@xenosoft.de>
 <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
 <87mtma8udh.wl-maz@kernel.org>
 <c95c9b58-347e-d159-3a82-bf5f9dbf91ac@xenosoft.de>
 <87lf1t8pab.wl-maz@kernel.org>
 <a02c370d-1356-daac-25c4-02d222c91364@xenosoft.de>
 <87ilwx8ma5.wl-maz@kernel.org>
 <d044e62f-c7f8-4ec7-dbc6-ce61767e295f@xenosoft.de>
 <0baf0f26-ab82-ca19-ea9f-7f461ce32aa5@xenosoft.de>
 <db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de>
 <3574beaa3ae41167f8a7f3f32b862288e7410d1f.camel@physik.fu-berlin.de>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <3574beaa3ae41167f8a7f3f32b862288e7410d1f.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Adrian,

On 08 October 2025 at 06:40 pm, John Paul Adrian Glaubitz wrote:
> Hi Christian,
>
> On Wed, 2025-10-08 at 18:35 +0200, Christian Zigotzky wrote:
>> Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
>>
>> Without the pci-v6.18-changes, the PPC boards boot without any problems.
>>
>> Boot log with error messages:
>> https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
>>
>> Further information: https://github.com/chzigotzky/kernels/issues/17
>>
>> Please check the pci-v6.18-changes. [2]
> Can you try bisecting this issue? The commit you are referring to is a merge
> commit and contains a lot of changes, so tracking down the problem is not
> easy unless we know the exact commit that has introduced the problem.
>
> Thanks for testing!
>
> Adrian
>
Unfortunately, I don't have time for bisecting because my main work 
needs more time currently.

Christian

